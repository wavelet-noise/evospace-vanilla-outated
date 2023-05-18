local simple_blocks = {"WoodenPlanks",
"AdminBlocks",
"StoneTiles",
"RedTiles",
"DarkTiles",
"Terracotta",
"TerracottaTiles",
"Bricks",
"RedBricks",
"DarkBricks",
"TerracottaBricks",
"Concrete",
"ConcreteBricks",
"ConcreteTiles",
"ConcreteSmallTiles",
"ReinforcedConcrete",
"ReinforcedConcreteTiles",
"ReinforcedConcreteSmallTiles",
"ReinforcedConcreteBricks",
"DangerBlock",
"RustyCopperCasing",
"RustyIronCasing",
"BasicPlatform",
"PlasticBlock",
"GlassBlock",
"PaintWhite",
"PaintGray",
"PaintBlack",
"PaintGreen",
"PaintRed",
"PaintBlue",
"PaintCopper",
"PaintSteel",
"PaintStainlessSteel",
"PaintTitanium",
"PaintHardMetal",
"PaintGold",
"PaintYellow",
"PaintMagenta",
"PaintCyan"}

local mapgen_objects = {"Sand","Sandstone","Stone","DesertSand","Grass","Lava","Basalt","Bog","PineForest","Dirt","Gravel","DryGrass","Limestone","RedStone","DarkStone","Snow","Granite","Peat"}

function register_misc_items()
    for _, block_name in pairs(simple_blocks) do
        local block = Block.get(block_name)
        local item = Item.get(block_name)
        local item_logic = PlaneBuilder.get(block_name)
        item_logic.block = block
        item.logic, item_logic.item = item_logic, item
    end

    for _, block_name in pairs(mapgen_objects) do
        local block = Block.get(block_name.."Surface")
        local item = Item.get(block_name.."Surface")
        local item_logic = SphereBuilder.get(block_name.."Surface")
        item_logic.block = block
        item.logic, item_logic.item = item_logic, item
    end
end