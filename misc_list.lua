simple_deco = {}
wooden_misc = {}
simple_single = {}
static_mesh_block = {}

simple_blocks = {
    {name = "WoodenPlanks", tier = 0},
    {name = "AdminBlocks", tier = 0},
    {name = "StoneTiles", tier = 0},
    {name = "RedTiles", tier = 0},
    {name = "DarkTiles", tier = 0},
    {name = "Terracotta", tier = 0},
    {name = "TerracottaTiles", tier = 0},
    {name = "Bricks", tier = 0},
    {name = "RedBricks", tier = 0},
    {name = "DarkBricks", tier = 0},
    {name = "TerracottaBricks", tier = 0},
    {name = "Concrete", tier = 2},
    {name = "ConcreteBricks", tier = 2},
    {name = "ConcreteTiles", tier = 2},
    {name = "ConcreteSmallTiles", tier = 2},
    {name = "ReinforcedConcrete", tier = 2},
    {
        name = "ReinforcedConcreteTiles",
        tier = 2,
    },
    {
        name = "ReinforcedConcreteSmallTiles",
        tier = 2,
    },
    {
        name = "ReinforcedConcreteBricks",
        tier = 2,
    },
    {name = "DangerBlock", tier = 2},
    {name = "RustyCopperCasing", tier = 1},
    {name = "RustyIronCasing", tier = 2},
    {name = "BasicPlatform", tier = 0},
    {name = "PlasticBlock", tier = 0},
    {name = "GlassBlock", tier = 0},
    {name = "PaintWhite", tier = 0},
    {name = "PaintGray", tier = 0},
    {name = "PaintBlack",, tier = 0},
    {name = "PaintGreen", tier = 0},
    {name = "PaintRed", tier = 0},
    {name = "PaintBlue", tier = 0},
    {name = "PaintCopper", tier = 0},
    {name = "PaintSteel", tier = 0},
    {name = "PaintStainlessSteel", tier = 0},
    {name = "PaintTitanium", tier = 0},
    {name = "PaintHardMetal", tier = 0},
    {name = "PaintGold", tier = 0},
    {name = "PaintYellow", tier = 0},
    {name = "PaintMagenta", tier = 0},
    {name = "PaintCyan", tier = 0}
}

wooden_misc = [
    {name = "Chair"},
    {name = "Table", sub_blocks = { Vec3i.new(0, 0, 0), Vec3i.new(-1, 0, 0) }},
    {name = "Rack"},
    {
        name = "Bed",
        sub_blocks = { Vec3i.new(0, 0, 0), Vec3i.new(-1, 0, 0) },
        block_logic =  "BedBlockLogic",
    },
    {name = "Ladder"},
    {
        name = "Door",
        sub_blocks = { Vec3i.new(0, 0, 0), Vec3i.new(0, 0, 1) },
        block_logic =  "DoorBlockLogic",
    },
    {name = "Window", sub_blocks = { Vec3i.new(0, 0, 0), Vec3i.new(0, 0, 1) }},
]

simple_single = [
    {
        name = "CeramicRoof",
    },
    {
        name = "Stairs",
    },
    {
        name = "WoodenStairs",
    },
    {
        name = "CopperChair",
    },
    {
        name = "FireCup",
    },
    {name = "PlasticWindow", sub_blocks = { Vec3i.new(0, 0, 0), Vec3i.new(0, 0, 1) }},
    {name = "SteelFence", block_logic =  "FenceBlockLogic", tier = 1},
    {name = "StainlessSteelFence", block_logic =  "FenceBlockLogic", tier = 2},
    {
        name = "Fence",
        block_logic =  "FenceBlockLogic",
    },
]

-- ,{
-- 		name = "Campfire",
-- 		tier = 0
-- 	}
-- 	{
-- 		name = "CeramicPlate",
-- 		tier = 0
-- 	},{
-- 		name = "Candle",
-- 		tier = 0
-- 	},{
-- 		name = "CeramicCup",
-- 		tier = 0
-- 	},{
-- 		name = "CeramicPot",
-- 		tier = 0
-- 	}

simple_deco = [
    {name = "Firefly"},
    {name = "Flies"},
    {name = "Birds"},
    {name = "DesertSound"},
    {name = "SwampSound"},
    {name = "Butterfly"},
    {name = "Leafes"},
    {name = "Bugs"},
]

static_mesh_block = [{name = "Column"}, {name = "FluetedColumn"}]

equipped = [
    {name = "Torch", item_logic = "Equipped/TorchBP.TorchBP_C"},
    {name = "Flashlight", item_logic = "Equipped/FlashlightBP.FlashlightBP_C"},
    {name = "NightVision", item_logic = "Equipped/NightVisionBP.NightVisionBP_C"},
    {
        name = "AdvancedNightVision",
        item_logic =  "Equipped/AdvancedNightVisionBP.AdvancedNightVisionBP_C",
    },
    {name = "Steampack", item_logic = "Equipped/SteampackBP.SteampackBP_C"},
    {name = "Jetpack", item_logic = "Equipped/JetpackBP.JetpackBP_C"},
    {
        name = "AdvancedJetpack",
        item_logic = "Equipped/AdvancedJetpackBP.AdvancedJetpackBP_C",
    },
    {
        name = "AntigravityUnit",
        item_logic =  "Equipped/AntigravityUnitBP.AntigravityUnitBP_C",
    },
    {name = "Scanner", item_logic = "Equipped/ScannerBP.ScannerBP_C"},
]