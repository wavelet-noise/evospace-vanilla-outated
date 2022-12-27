require("common")
require("machines_list")

function register_machines()
    for _, machine in pairs(machines) do
        for _, tier in pairs(tiers_numlist) do
            if machine.start_tier <= tier and machine.end_tier >= tier then
                local item_name = tier_material[tier + 1] .. machine.name
                local block_name = tier_material[tier + 1] .. machine.name

                print("Register machine "..machine.name)

                local image = machine.name
                if machine.image ~= nil then
                    image = machine.image
                end

                local texture = IcoGenerator.combine(
                    Texture.find("T_" .. image),
                    Texture.find("T_" .. tier_material[tier + 1]),
                    {Texture.find("T_" .. image .. "Additive")}
                )

                local level = tier - machine.start_tier

                local item = Item.reg(item_name)
                item.max_count = 32
                item.label_parts = {
                    Loc.new(tier_material[tier + 1], "common"),
                    Loc.new(machine.name, "machines"),
                }
                item.image = texture
                item.category = camel_to_spaces(tier_material[tier + 1])
                item.page = "Machines"
                item.logic = Class.find(building_single_logic)
                item.label_format = Loc.new("machines_label_format", "common")
                local description_parts = {
                    Loc.new(machine.name, "description_machines")
                }

                -- local item = {
                --     logic_json = {
                --         Block = block_name,
                --     },
                --     item_logic = building_single_logic,
                -- }

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

                -- if machine.path_finding then
                --     item.LogicJson.building_mode = "path_finding"
                -- end

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
                
                -- if machine.CustomData then
                --     local dict = deepcopy(machine.custom_data)
                --     for key, value in pairs(dict) do
                --         if string.find(tostring(value), "%Material%") then
                --             dict[key] = string.gsub(value, "%Material%", tier_material[tier])
                --         end
                --         if key == "StorageCapacity" then
                --             dict[key] = value * 2^level
                --         end
                --     end
                
                --     for k, v in pairs(dict) do
                --         logic[k] = v
                --     end
                -- end

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
                
                --logic.ActorCreation = ""

                local block = Block.reg(block_name)
                block.item = item
                --block.logic_json = logic
                --block.block_logic = machine.name .. "BlockLogic"
                --block.replace_tag = machine.name
                
                local logic
                if machine.block_logic then
                    logic = BlockLogic.reg_derived(block_name, Class.find(machine.block_logic))
                else
                    logic = BlockLogic.reg_derived(block_name, Class.find(machine.name))
                end

                logic.tier = tier
                logic.level = level
                logic.recipes = RecipeDictionary.find(machine.recipes or machine.name)

                block.logic = logic

                -- local logic = {
                --     Recipes = machine.recipes or machine.name,
                --     Tier = tier,
                --     Level = level,
                -- }
                
                --block.Actor = "/Game/Blocks/" .. machine.name .. "BP." .. machine.name .. "BP_C"
                
                if machine.selector then
                    --block.selector = machine.selector
                end
                
                if machine.positions then
                    --block.positions = machine.positions
                end
            end
        end
    end
end