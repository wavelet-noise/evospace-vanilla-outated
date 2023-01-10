require("misc_list")

function register_misc()
    for _, one in pairs(simple_blocks) do

        local item = Item.get(one.name)
        item.image = Texture.find("T_" .. one["name"])
        item.max_count = 999
        item.label_parts = {Loc.new(one["name"], "misc")}

        local tesselator = TesselatorCube.get(one.name)
        tesselator:set_material(Material.load("Materials/" .. one["name"]))

        local block = Block.get(one.name)
        block.tesselator = tesselator
        block.item = item



    -- objects_array.append(
    --     {
    --         "class": static_item,
    --         "name": one["name"],
    --         "image": "T_" + one["name"],
    --         "item_logic": building_plane_logic,
    --         "logic_json": {"Block": one["name"], "BuildingMode": "Plane"},
    --         "max_count": 999,
    --         "tag": "Decoration",
    --         "label_parts": [[one["name"], "misc"]],
    --         "category": "Block",
    --         "description_parts": [["BuildingBlock", "common"]],
    --     }
    -- )
    -- objects_array.append(
    --     {
    --         "class": tesselator_cube,
    --         "name": one["name"],
    --         "Material": "Materials/" + one["name"],
    --     }
    -- )
    -- objects_array.append(
    --     {
    --         "class": static_block,
    --         "name": one["name"],
    --         "Item": one["name"],
    --         "Tesselator": one["name"],
    --     }
    -- )
    end

    for _, one in pairs(wooden_misc) do
        local item = Item.get(one.name)
        item.image = Texture.find("T_" .. one["name"])
        item.max_count = 32
        item.label_parts = {Loc.new(one["name"], "misc")}
        item.tag = "Decoration"

        local block = Block.get(one.name)
        block.actor = Class.load("/Game/Blocks/" .. machine.name .. "BP." .. machine.name .. "BP_C")
        block.logic = one.block_logic and _G[block_logic].get(one.name) or BlockLogic.get(one.name)

        if one.sub_blocks then
            block.sub_blocks = one.sub_blocks
        end

        block.item, item.block = item, block
    end
end