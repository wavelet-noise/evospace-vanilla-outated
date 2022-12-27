require("common")
require("materials_list")

function register_materials()
    for _, material in pairs(materials) do
        if material.is_block then
            local item = Item.reg(material.name .. "Block")
            item.image = IcoGenerator.combine(
                Texture.find("T_" .. "Block"), 
                Texture.find("T_" .. material.name),
                {}
            )

            -- local item = {
            --     class = static_item,
            --     name = material.name .. "Block",
            --     image = "T_" .. material.name .. "Block",
            --     max_count = 999,
            --     -- "Mesh": "Models/Ingot",
            --     Materials = {"Materials/" .. material.name},
            --     label_parts = {{material.name .. "Block", "parts"}},
            --     tag = "Decoration",
            --     category = "Block",
            --     item_logic = building_cube_logic,
            --     logic_json = {Block = material.name .. "Block"},
            -- }
        
            -- if material.category then
            --     item.category = material.category
            -- end
        
            -- if material.tag then
            --     item.tag = material.tag
            -- end

            local tesselator = TesselatorCube.reg(material.name .. "Block")
            tesselator:set_material(Material.load("Materials/" .. material["name"]))

            local block = Block.reg(material.name .. "Block")
            block.item = item
            block.tesselator = tesselator
        
            -- images.append({
            --     NewName = "T_" .. material.name .. "Block",
            --     Base = "T_" .. "Block",
            --     MulMask = "T_" .. material.name,
            --     AddMask = "T_" .. "Block" .. additive_ico,
            -- })
            -- objects_array.append({
            --     class = tesselator_cube,
            --     name = material.name .. "Block" .. tesselator,
            --     Material = "Materials/" .. material.name,
            -- })
        end
    end
end