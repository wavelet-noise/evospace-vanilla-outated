require("common")
require("machines_list")

function register_machines()
    for _, machine in pairs(machines) do
        for _, tier in pairs(tiers_numlist) do
            if machine.start_tier <= tier and machine.end_tier >= tier then
                local name = tier_material[tier + 1] .. machine.name

                print("Register machine "..name)

                local image = machine.name
                if machine.image then
                    image = machine.image
                end

                local texture = IcoGenerator.combine(
                    Texture.find("T_" .. image),
                    Texture.find("T_" .. tier_material[tier + 1]),
                    {Texture.find("T_" .. image .. "Additive")}
                )

                local level = tier - machine.start_tier

                local item = Item.get(name)
                item.max_count = 32
                item.label_parts = {
                    Loc.new(tier_material[tier + 1], "common"),
                    Loc.new(machine.name, "machines"),
                }
                item.image = texture
                item.category = camel_to_spaces(tier_material[tier + 1])
                item.page = "Machines"
                item.label_format = Loc.new("machines_label_format", "common")
                local description_parts = {
                    Loc.new(machine.name, "description_machines")
                }

                local conv_speed_d = {1.66, 2.5, 3.33, 5, 6.66, 10, 20}
                local arm_speed_d = {
                    300 / 2,
                    450 / 2,
                    600 / 2,
                    900 / 2,
                    1200 / 2,
                    1800 / 2,
                    3600 / 2,
                }

                if machine.description then
                    for _, ss in pairs(machine.description) do
                        if ss == "SpeedBonus" then
                            if level ~= 0 then
                                table.insert(
                                    description_parts,
                                    Loc.new_param("speedbonus", "common", math.floor(1.5^level * 10) / 10)
                                )
                            end
                        elseif ss == "PowerOutput" then
                            table.insert(
                                description_parts,
                                Loc.new_param(
                                    "power_output",
                                    "common",
                                    machine.power_output * 20 * 2^level
                                )
                            )
                        else
                            table.insert(description_parts,  Loc.new(ss, "common"))
                        end
                    end
                end

                item.description_parts = description_parts


                -- if machine.BlockCreation then
                --     logic.BlockCreation = machine.BlockCreation
                --     if string.find(logic.BlockCreation, "%Material%") then
                --         logic.BlockCreation = string.gsub(logic.BlockCreation, "%Material%", tier_material[tier])
                --     end
                --     if string.find(logic.BlockCreation, "%Level%") then
                --         logic.BlockCreation = string.gsub(logic.BlockCreation, "%Level%", tostring(tier - machine.start_tier))
                --     end
                --     if string.find(logic.BlockCreation, "%Tier%") then
                --         logic.BlockCreation = string.gsub(logic.BlockCreation, "%Tier%", tostring(tier))
                --     end
                -- end


                local block = Block.get(name)
                block.item = item
                local item_logic = BlockBuilder.get(name)
                item_logic.block = block
                item.logic, item_logic.item = item_logic, item
                if machine.path_finding then
                    item_logic.mode = BuildingMode.path_finding
                end

                block.replace_tag = machine.name

                local logic_type
                if machine.logic then
                    logic_type = machine.logic
                else
                    error("No type")
                end

                local logic = logic_type.get(name)
                logic.tier, logic.level = tier, level
                if logic.recipe_dictionary ~= nil then
                    logic.recipe_dictionary = RecipeDictionary.get(machine.name)
                end
                block.logic, logic.block = logic, block
                if machine.custom_data then
                    local dict = deepcopy(machine.custom_data)
                    for k, v in pairs(machine.custom_data) do
                        if k == "storage_capacity" then
                            dict[k] = v * 2^level
                        end
                    end

                    for k, v in pairs(dict) do
                        logic[k] = v
                    end
                end

                if machine.block_creation then
                    machine.block_creation(logic)
                end

                block.actor = Class.load("/Game/Blocks/" .. machine.name .. "BP." .. machine.name .. "BP_C")
                if machine.selector then
                    block.selector = Class.load(machine.selector)
                else
                    block.selector = block.actor
                end

                if machine.sub_blocks then
                    block.sub_blocks = machine.sub_blocks
                end

                if machine.unbreakable == nil then
                    append_recipe(
                        RecipeDictionary.get("Multitool"),
                        {
                            name = name.."Wrenching",
                            ticks = 20,
                            input = {
                                {
                                    name = name,
                                    count = 1,
                                }
                            },
                            output = {
                                {
                                    name = name,
                                    count = 1,
                                }
                            },
                        }
                    )
                end
            end
        end
    end
end