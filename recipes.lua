require("common")
require("materials_list")

function register_recipes()
    local recipes_wrench = {}
    local recipes_blast_furnace = {}
    local recipes_oven = {}
    local recipes_smelter = {}
    local recipes_arc_furnace = {}
    local recipes_macerator = {}
    local recipes_boiler = {}
    local recipes_farm = {}
    local recipes_condens = {}
    local recipes_generator = {}
    local recipes_electric_engine = {}
    local recipes_compact_generator = {}
    local recipes_steam_engine = {}
    local recipes_steam_turbine = {}
    local recipes_pump = {}
    local recipes_electrolyzer = {}
    local recipes_cutter = {}
    local recipes_furnace = {}
    local recipes_ferm = {}
    local recipes_toolarm = {}
    local recipes_hammer = {}
    local recipes_mixer = {}
    local recipes_chem = {}
    local recipes_sep = {}
    local recipes_sep2 = {}
    local recipes_press = {}
    local recipes_elfurn = {}
    local recipes_radiator = {}
    local recipes_solar = {}
    local recipes_fission = {}
    local recipes_coil = {}
    local recipes_indu = {}
    local recipes_exch = {}
    local recipes_iexch = {}
    local recipes_freezer = {}
    local recipes_combustion = {}
    local recipes_pyro = {}
    local recipes_computer = {}
    local recipes_q_computer = {}
    local recipes_assembler = {}
    local recipes_gasturb = {}
    local recipes_filtering_unit = {}
    local recipes_chemical_bath = {}
    local recipes_centrifuge = {}
    local recipes_riteg = {}
    local recipes_industrial_steam_turbine = {}
    local recipes_fusion_reactor = {}
    local recipes_industrial_boiler = {}
    local recipes_industrial_electric_engine = {}
    local recipes_portal = {}
    local recipes_hand = {}

    local function append_recipe_hand_assembler(recipe)
        local item_count = 0
        for _, item in pairs(recipe.input) do
            item_count = item_count + item.count
        end

        local level = extract_tier(recipe.output[1].name) + 1

        local dec_recipe = deepcopy(recipe)

        table.insert(recipes_hand, recipe)

        dec_recipe.ticks = math.max(math.min(item_count * 10, 400), 20)
        dec_recipe.res_input = {name = "Electricity", count = 20 * level}
        table.insert(recipes_assembler, dec_recipe)
    end

    local function append_recipe_hand_press(recipe)
        local item_count = 0
        for _, item in pairs(recipe.input) do
            item_count = item_count + item.count
        end

        local dec_recipe = deepcopy(recipe)

        table.insert(recipes_hand, recipe)

        dec_recipe.ticks = 60
        dec_recipe.res_input = {name = "Kinetic", count = 100}

        table.insert(recipes_press, dec_recipe)
    end

    -- wrenching

    table.insert(
        recipes_industrial_steam_turbine,
        {
            name = "Rotating",
            input = {},
            res_input = {name = "Steam", count = fission_fullpower * 0.9},
            output = {},
            res_output = {
                name = "Electricity",
                count = fission_fullpower * 0.9 * 0.9
            },
            ticks = 200,
            loss = 10
        }
    )

    table.insert(
        recipes_industrial_boiler,
        {
            name = "Boiling",
            input = {
                {name = "Water", count = 2000}
            },
            res_input = {name = "Heat", count = fission_fullpower},
            output = {},
            res_output = {name = "Steam", count = fission_fullpower * 0.9},
            ticks = 200
        }
    )

    table.insert(
        recipes_fusion_reactor,
        {
            name = "HotNeutroniumIngot1",
            input = {{name = "ProducerGas", count = 1000}},
            res_input = {
                name = "Electricity",
                count = fission_fullpower * 0.9 * 0.9
            },
            output = {{name = "HotNeutroniumIngot", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_fusion_reactor,
        {
            name = "HotNeutroniumIngot2",
            input = {{name = "ProducerGas", count = 3000}},
            res_input = {
                name = "Electricity",
                count = 2 * fission_fullpower * 0.9 * 0.9
            },
            output = {{name = "HotNeutroniumIngot", count = 1 * 3}},
            ticks = 200 * 2
        }
    )

    table.insert(
        recipes_fusion_reactor,
        {
            name = "HotNeutroniumIngot4",
            input = {{name = "UltimateCatalyst", count = 1, split = 0}},
            res_input = {
                name = "Electricity",
                count = fission_fullpower * 0.9 * 0.9
            },
            output = {{name = "HotNeutroniumIngot", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_fusion_reactor,
        {
            name = "HotNeutroniumIngot3",
            input = {{name = "UltimateCatalyst", count = 3, split = 0}},
            res_input = {
                name = "Electricity",
                count = 2 * fission_fullpower * 0.9 * 0.9
            },
            output = {{name = "HotNeutroniumIngot", count = 1 * 3}},
            ticks = 200 * 2
        }
    )

    table.insert(
        recipes_smelter,
        {
            name = "Glass",
            input = {
                {name = "SandSurface", count = 1}
            },
            res_input = {name = "Heat", count = 10},
            output = {{name = "Glass", count = 1}},
            ticks = 200
        }
    )

    for _, list in pairs({simple_deco, wooden_misc, simple_single, simple_blocks, static_mesh_block}) do
        for _, one in pairs(list) do
            table.insert(
                recipes_wrench,
                {
                    name = one.name .. "Wrenching",
                    ticks = 20,
                    input = {{name = one.name, count = 1}},
                    output = {{name = one.name, count = 1}}
                }
            )
        end
    end

    -- other

    append_recipe_hand_assembler(
        {
            name = "Cell",
            input = {
                {name = "StainlessSteelPlate", count = 1},
                {name = "StainlessSteelParts", count = 1}
            },
            output = {{name = "Cell", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "Cell2",
            input = {
                {name = "DepletedUraniumCell", count = 1}
            },
            output = {{name = "Cell", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "UraniumCell",
            input = {
                {name = "Uranium235Dust", count = 3},
                {name = "UraniumDust", count = 20},
                {name = "Cell", count = 1}
            },
            output = {{name = "UraniumCell", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "ThoriumCell",
            input = {
                {name = "ThoriumDust", count = 20},
                {name = "Cell", count = 1}
            },
            output = {{name = "ThoriumCell", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "Uranium233Cell",
            input = {
                {name = "Uranium233Dust", count = 3},
                {name = "Cell", count = 1}
            },
            output = {{name = "Uranium233Cell", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "PlutoniumCell",
            input = {
                {name = "PlutoniumDust", count = 3},
                {name = "Cell", count = 1}
            },
            output = {{name = "PlutoniumCell", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "FilteringCell",
            input = {
                {name = "Coal", count = 10},
                {name = "Cell", count = 1}
            },
            output = {{name = "FilteringCell", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "Circuit",
            input = {
                {name = "CircuitBoard", count = 1},
                {name = "CopperWire", count = 6}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "Circuit", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "AdvancedCircuit",
            input = {
                {name = "Silicon", count = 1},
                {name = "Circuit", count = 1}
            },
            res_input = {name = "Electricity", count = 30},
            output = {{name = "AdvancedCircuit", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "SiliconWafer",
            input = {
                {name = "Silicon", count = 1}
            },
            res_input = {name = "Electricity", count = 100},
            output = {{name = "SiliconWafer", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "Processor",
            input = {
                {name = "SiliconWafer", count = 1},
                {name = "AdvancedCircuit", count = 1}
            },
            res_input = {name = "Electricity", count = 80},
            output = {{name = "Processor", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "QuantumBrain",
            input = {
                {name = "QuantumProcessor", count = 2},
                {name = "UltimateCatalyst", count = 1}
            },
            res_input = {name = "Electricity", count = 1000},
            output = {{name = "QuantumBrain", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "Catalyst",
            input = {
                {name = "Cell", count = 1},
                {name = "GoldWire", count = 10},
                {name = "Coal", count = 4}
            },
            output = {{name = "Catalyst", count = 1}},
            ticks = 200
        }
    )

    append_recipe_hand_assembler(
        {
            name = "UltimateCatalyst",
            input = {
                {name = "Cell", count = 1},
                {name = "NeutroniumParts", count = 8},
                {name = "Coke", count = 10}
            },
            output = {{name = "UltimateCatalyst", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "AdvancedCircuitBoard",
            input = {
                {name = "Plastic", count = 1},
                {name = "GoldWire", count = 3}
            },
            res_input = {name = "Electricity", count = 20},
            output = {{name = "AdvancedCircuitBoard", count = 1}},
            ticks = 80
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "Processor2",
            input = {
                {name = "SiliconWafer", count = 1},
                {name = "AdvancedCircuitBoard", count = 1}
            },
            res_input = {name = "Electricity", count = 80},
            output = {{name = "Processor", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "QuantumCore",
            input = {
                {name = "RareEarthElement", count = 1},
                {name = "CopperParts", count = 2}
            },
            res_input = {name = "Electricity", count = 1000},
            output = {{name = "QuantumCore", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "QuantumCircuit",
            input = {
                {name = "QuantumCore", count = 2},
                {name = "AdvancedCircuitBoard", count = 1}
            },
            res_input = {name = "Electricity", count = 1000 / 7},
            output = {{name = "QuantumCircuit", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "QuantumProcessor",
            input = {
                {name = "QuantumCircuit", count = 1},
                {name = "Processor", count = 1}
            },
            res_input = {name = "Electricity", count = 2000 / 13},
            output = {{name = "QuantumProcessor", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "CopperWire",
            input = {
                {name = "CopperIngot", count = 1}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "CopperWire", count = 2}},
            ticks = 100
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "SuperconductorWire",
            input = {
                {name = "SuperconductorIngot", count = 1}
            },
            res_input = {name = "Electricity", count = 100},
            output = {{name = "SuperconductorWire", count = 2}},
            ticks = 100
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "Battery",
            input = {
                {name = "SulfuricAcid", count = 100},
                {name = "CopperParts", count = 1},
                {name = "StainlessSteelPlate", count = 1}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "Battery", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_assembler,
        {
            name = "GoldWire",
            input = {
                {name = "GoldIngot", count = 1}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "GoldWire", count = 2}},
            ticks = 100
        }
    )

    append_recipe_hand_assembler(
        {
            name = "ReflectorCell",
            input = {
                {name = "Cell", count = 1},
                {name = "BerylliumDust", count = 3}
            },
            output = {{name = "ReflectorCell", count = 1}},
            ticks = 100
        }
    )

    append_recipe_hand_assembler(
        {
            name = "ControlCell",
            input = {
                {name = "Cell", count = 1},
                {name = "BoronDust", count = 3}
            },
            res_input = {name = "Electricity", count = 1000 / 9},
            output = {{name = "ControlCell", count = 1}},
            ticks = 100
        }
    )

    table.insert(
        recipes_condens,
        {
            name = "Water",
            input = {},
            output = {{name = "Water", count = 250}},
            ticks = 200
        }
    )

    table.insert(
        recipes_condens,
        {
            name = "Oxygen",
            input = {},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "Oxygen", count = 250}},
            ticks = 200
        }
    )

    table.insert(
        recipes_condens,
        {
            name = "Nitrogen",
            input = {},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "Nitrogen", count = 1000}},
            ticks = 200
        }
    )

    table.insert(
        recipes_condens,
        {
            name = "Helium",
            input = {},
            res_input = {name = "Kinetic", count = 40},
            output = {{name = "Helium", count = 100}},
            ticks = 200
        }
    )

    table.insert(
        recipes_condens,
        {
            name = "Methane",
            input = {},
            res_input = {name = "Kinetic", count = 40},
            output = {{name = "Methane", count = 80}},
            ticks = 200
        }
    )

    table.insert(
        recipes_condens,
        {
            name = "Hydrogen",
            input = {},
            res_input = {name = "Kinetic", count = 40},
            output = {{name = "Hydrogen", count = 50}},
            ticks = 200
        }
    )

    table.insert(
        recipes_farm,
        {
            name = "Logs",
            input = {{name = "Water", count = 625}},
            output = {{name = "Log", count = 15}},
            ticks = 2000
        }
    )

    table.insert(
        recipes_farm,
        {
            name = "Pumpkin",
            input = {{name = "Water", count = 625}},
            output = {{name = "Pumpkin", count = 10}},
            ticks = 1000
        }
    )

    table.insert(
        recipes_centrifuge,
        {
            name = "DepletedUraniumCell",
            input = {{name = "DepletedUraniumCell", count = 1}},
            output = {
                {
                    name = "PlutoniumDust",
                    count = 1,
                    split = 10
                }
            },
            res_input = {name = "Kinetic", count = 100},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "UraniumCell",
            input = {{name = "UraniumCell", count = 1}},
            output = {{name = "DepletedUraniumCell", count = 1}},
            res_output = {name = "Heat", count = 7100},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "UraniumCell2",
            input = {
                {name = "UraniumCell", count = 2},
                {
                    name = "ControlCell",
                    count = 1,
                    split = 0
                }
            },
            output = {{name = "DepletedUraniumCell", count = 2}},
            res_output = {name = "Heat", count = 7100 * 2.2},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "UraniumCell3",
            input = {
                {name = "UraniumCell", count = 3},
                {
                    name = "ControlCell",
                    count = 1,
                    split = 0
                }
            },
            output = {{name = "DepletedUraniumCell", count = 3}},
            res_output = {name = "Heat", count = 7100 * 3.3},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "UraniumCell4",
            input = {
                {name = "UraniumCell", count = 3},
                {
                    name = "ControlCell",
                    count = 5,
                    split = 0
                }
            },
            output = {{name = "DepletedUraniumCell", count = 3}},
            res_output = {name = "Heat", count = 7100 * 3.3 / 2},
            ticks = 2000 * 2
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "ControlCell3",
            input = {
                {name = "UraniumCell", count = 1},
                {
                    name = "ControlCell",
                    count = 3,
                    split = 0
                }
            },
            output = {{name = "DepletedUraniumCell", count = 1}},
            res_output = {name = "Heat", count = 7100 / 4},
            ticks = 8000 * 0.9 * 0.9
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "ThoriumCell",
            input = {
                {
                    name = "UraniumCell",
                    count = 3
                },
                {
                    name = "ReflectorCell",
                    count = 1,
                    split = 0
                },
                {
                    name = "ThoriumCell",
                    count = 2
                }
            },
            output = {
                {name = "DepletedUraniumCell", count = 3},
                {
                    name = "Uranium233Cell",
                    count = 2
                }
            },
            res_output = {name = "Heat", count = 200},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "PlutoniumCell",
            input = {
                {
                    name = "PlutoniumCell",
                    count = 1
                },
                {
                    name = "ReflectorCell",
                    count = 1,
                    split = 0
                },
                {
                    name = "ThoriumCell",
                    count = 3
                }
            },
            output = {
                {
                    name = "Uranium233Cell",
                    count = 3
                },
                {name = "DepletedUraniumCell", count = 1}
            },
            res_output = {name = "Heat", count = 200},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "PlutoniumCell2",
            input = {
                {
                    name = "PlutoniumCell",
                    count = 1
                },
                {
                    name = "ReflectorCell",
                    count = 2,
                    split = 0
                },
                {
                    name = "ThoriumCell",
                    count = 6
                }
            },
            output = {
                {
                    name = "Uranium233Cell",
                    count = 6
                },
                {name = "DepletedUraniumCell", count = 1}
            },
            res_output = {name = "Heat", count = 200},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "ControlCell",
            input = {
                {name = "UraniumCell", count = 1},
                {
                    name = "ControlCell",
                    count = 1,
                    split = 0
                }
            },
            output = {{name = "DepletedUraniumCell", count = 1}},
            res_output = {name = "Heat", count = 7100 / 2},
            ticks = 4000 * 0.9
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "Uranium233Cell",
            input = {
                {
                    name = "Uranium233Cell",
                    count = 1
                },
                {
                    name = "ControlCell",
                    count = 1,
                    split = 0
                }
            },
            output = {
                {
                    name = "DepletedUraniumCell",
                    count = 1
                }
            },
            res_output = {name = "Heat", count = 7100 * 3.3},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "Uranium233Cell2",
            input = {
                {
                    name = "Uranium233Cell",
                    count = 2
                },
                {
                    name = "ControlCell",
                    count = 1,
                    split = 0
                }
            },
            output = {
                {
                    name = "DepletedUraniumCell",
                    count = 2
                }
            },
            res_output = {name = "Heat", count = fission_fullpower / 2},
            ticks = 2000
        }
    )

    table.insert(
        recipes_fission,
        {
            name = "Uranium233Cell3",
            input = {
                {
                    name = "Uranium233Cell",
                    count = 4
                },
                {
                    name = "ControlCell",
                    count = 1,
                    split = 0
                }
            },
            output = {
                {
                    name = "DepletedUraniumCell",
                    count = 4
                }
            },
            res_output = {name = "Heat", count = fission_fullpower},
            ticks = 2000
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "AluminothermicChromiumDust",
            input = {
                {name = "AluminiumDust", count = 1},
                {name = "ChromiumOxideDust", count = 1}
            },
            output = {
                {name = "ChromiumDust", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 10
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "CinnabarDust",
            input = {{name = "CinnabarDust", count = 2}},
            output = {
                {name = "Mercury", count = 1000},
                {name = "Sulfur", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 10
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_boiler,
        {
            name = "Boiling",
            input = {
                {name = "Water", count = 50}
            },
            res_input = {
                name = "Heat",
                count = 110
            },
            output = {},
            res_output = {
                name = "Steam",
                count = 100
                -- capacity = 32000,
            },
            ticks = 200,
            loss = 10
        }
    )

    table.insert(
        recipes_steam_turbine,
        {
            name = "Rotating",
            input = {},
            res_input = {name = "Steam", count = 300},
            output = {},
            res_output = {name = "Kinetic", count = 270},
            ticks = 200,
            loss = 10
        }
    )

    table.insert(
        recipes_generator,
        {
            name = "Generating",
            input = {},
            res_input = {name = "Kinetic", count = 270},
            output = {},
            res_output = {name = "Electricity", count = 243},
            ticks = 200,
            loss = 10
        }
    )

    table.insert(
        recipes_electric_engine,
        {
            name = "Rotating",
            input = {},
            res_input = {name = "Electricity", count = 55},
            output = {},
            res_output = {name = "Kinetic", count = 50},
            loss = 10,
            ticks = 200
        }
    )

    table.insert(
        recipes_industrial_electric_engine,
        {
            name = "Rotating",
            input = {},
            res_input = {name = "Electricity", count = 55 * 50},
            output = {},
            res_output = {name = "Kinetic", count = 50 * 50},
            loss = 10,
            ticks = 200
        }
    )

    table.insert(
        recipes_compact_generator,
        {
            name = "Rotating",
            input = {},
            res_input = {name = "Kinetic", count = 20},
            output = {},
            res_output = {name = "Electricity", count = 18},
            loss = 10,
            ticks = 200
        }
    )

    table.insert(
        recipes_steam_engine,
        {
            name = "Rotating",
            input = {},
            res_input = {name = "Heat", count = 11},
            output = {},
            res_output = {name = "Kinetic", count = 10},
            ticks = 200,
            loss = 10
        }
    )

    table.insert(
        recipes_oven,
        {
            name = "CoalPieceToCoke",
            input = {{name = "Coal", count = 10}},
            output = {
                {name = "Coke", count = 10},
                {
                    name = "Creosote",
                    count = 250,
                    capacity = 32000
                }
            },
            ticks = 2000
        }
    )

    table.insert(
        recipes_oven,
        {
            name = "LogToCoal",
            input = {{name = "Log", count = 10}},
            output = {
                {name = "Coal", count = 10},
                {
                    name = "Creosote",
                    count = 100,
                    capacity = 32000
                }
            },
            ticks = 2000
        }
    )

    table.insert(
        recipes_oven,
        {
            name = "PlankToCoal",
            input = {{name = "Plank", count = 10}},
            output = {
                {name = "Coal", count = 3},
                {
                    name = "Creosote",
                    count = 30,
                    capacity = 32000
                }
            },
            ticks = 500
        }
    )

    table.insert(
        recipes_oven,
        {
            name = "OrgToCoal",
            input = {{name = "Organics", count = 10}},
            output = {
                {name = "Coal", count = 2},
                {
                    name = "Creosote",
                    count = 20,
                    capacity = 32000
                }
            },
            ticks = 500
        }
    )

    table.insert(
        recipes_oven,
        {
            name = "Terracotta",
            input = {{name = "Clay", count = 10}},
            output = {
                {name = "Terracotta", count = 10}
            },
            ticks = 1000
        }
    )

    table.insert(
        recipes_blast_furnace,
        {
            name = "IronIngotSmelting",
            input = {
                {name = "Coke", count = 15},
                {name = "IronIngot", count = 10}
            },
            output = {{name = "SteelIngot", count = 10}},
            ticks = 2000
        }
    )

    table.insert(
        recipes_blast_furnace,
        {
            name = "IronDustSmelting",
            input = {
                {name = "Coke", count = 10},
                {name = "IronDust", count = 10}
            },
            output = {{name = "SteelIngot", count = 10}},
            ticks = 2000
        }
    )

    table.insert(
        recipes_blast_furnace,
        {
            name = "IronOreDustSmelting",
            input = {
                {name = "Coke", count = 20},
                {name = "IronOreDust", count = 10}
            },
            output = {{name = "SteelIngot", count = 10}},
            ticks = 2000
        }
    )

    table.insert(
        recipes_blast_furnace,
        {
            name = "IronOreDustSmelting" .. "Coke",
            input = {
                {name = "Coke", count = 1},
                {name = "SteelDust", count = 10}
            },
            output = {{name = "SteelIngot", count = 10}},
            ticks = 2000
        }
    )

    table.insert(
        recipes_mixer,
        {
            name = "ReinforcedConcrete",
            input = {
                {name = "Concrete", count = 10},
                {name = "SteelParts", count = 8},
                {name = "Water", count = 100}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "ReinforcedConcrete", count = 5}},
            ticks = 300
        }
    )
    table.insert(
        recipes_mixer,
        {
            name = "Concrete",
            input = {
                {name = "StoneSurface", count = 5},
                {name = "Water", count = 100}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "Concrete", count = 10}},
            ticks = 300
        }
    )
    table.insert(
        recipes_mixer,
        {
            name = "SSCraft",
            input = {
                {name = "IronDust", count = 10},
                {name = "ChromiumDust", count = 3}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "StainlessSteelDust", count = 10}},
            ticks = 400
        }
    )
    table.insert(
        recipes_mixer,
        {
            name = "SSCraft2",
            input = {
                {name = "IronOreDust", count = 10},
                {name = "ChromiumDust", count = 3}
            },
            res_input = {name = "Kinetic", count = 40},
            output = {{name = "StainlessSteelDust", count = 10}},
            ticks = 500
        }
    )

    table.insert(
        recipes_mixer,
        {
            name = "PreparedTitaniumOxideCraft",
            input = {
                {name = "TitaniumOxideDust", count = 1},
                {name = "Coke", count = 2}
            },
            res_input = {
                name = "Kinetic",
                count = 10
            },
            output = {{name = "PreparedTitaniumOxideDust", count = 1}},
            ticks = 200,
            scaled = false
        }
    )

    -- table.insert(
    --recipes_sep2,{
    -- 	name = "RareSeparating",
    -- 	input ={
    -- 		items ={
    -- 			{
    -- 				name = "RareEarthDust",
    -- 				count = 10
    -- 			},
    --#
    -- 		}
    -- 	},
    -- 	res_input ={
    -- 		name = "Kinetic",
    -- 		count = 50000
    -- 	},
    -- 	output ={
    --
    -- 			{
    -- 				name = "RareMetalsDust",
    -- 				count = 1
    -- 			},
    -- 			{
    -- 				name = "YttriumDust",
    -- 				count = 1
    -- 			},
    -- 			{
    -- 				name = "LutetiumDust",
    -- 				count = 1
    -- 			},
    -- 			{
    -- 				name = "DysprosiumDust",
    -- 				count = 1
    -- 			}
    -- 		}
    -- 	},
    --#
    -- 	ticks = 1000,
    -- })

    -- table.insert(
    --recipes_sep2,{
    -- name = "OreWater",
    -- input ={
    -- items ={
    -- {
    -- name = "OreWater",
    -- count = 1000
    -- },
    -- }
    -- },
    -- res_input ={
    -- name = "Kinetic",
    -- count = 30
    -- },
    -- output ={
    --
    -- {
    -- name = "Clay",
    -- count = 1
    -- },
    -- }
    -- },

    -- ticks = 200,
    -- })

    table.insert(
        recipes_sep2,
        {
            name = "PlutoniumDust",
            input = {
                {name = "DepletedUraniumCell", count = 1}
            },
            res_input = {name = "Kinetic", count = 30 * 90},
            output = {
                {name = "Cell", count = 1},
                {name = "PlutoniumDust", count = 1, split = 2}
            },
            ticks = 400
        }
    )

    table.insert(
        recipes_sep2,
        {
            name = "Granite",
            input = {
                {name = "GraniteSurface", count = 1}
            },
            res_input = {name = "Kinetic", count = 30 * 90},
            output = {
                {name = "SandSurface", count = 1},
                {
                    name = "TungstenOxideDust",
                    count = 1,
                    split = 10
                }
            },
            ticks = 40
        }
    )

    table.insert(
        recipes_sep2,
        {
            name = "Stone",
            input = {
                {name = "StoneSurface", count = 1}
            },
            res_input = {name = "Kinetic", count = 30},
            output = {
                {name = "SandSurface", count = 1},
                {
                    name = "AluminiumOxideDust",
                    count = 1,
                    split = 10
                }
            },
            ticks = 100
        }
    )

    table.insert(
        recipes_sep2,
        {
            name = "Basalt",
            input = {
                {name = "BasaltSurface", count = 1}
            },
            res_input = {name = "Kinetic", count = 30 * 25},
            output = {
                {name = "SandSurface", count = 1},
                {
                    name = "AluminiumOxideDust",
                    count = 1,
                    split = 5
                },
                {
                    name = "TitaniumOxideDust",
                    count = 1,
                    split = 10
                }
            },
            ticks = 40
        }
    )

    table.insert(
        recipes_sep2,
        {
            name = "Sand",
            input = {
                {name = "SandSurface", count = 1}
            },
            res_input = {name = "Kinetic", count = 30},
            output = {
                {
                    name = "SiliconOxide",
                    count = 1,
                    split = 2
                }
            },
            ticks = 100
        }
    )

    table.insert(
        recipes_arc_furnace,
        {
            name = "CopperOreDust",
            input = {
                {name = "CopperOreDust", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 20
            },
            output = {{name = "CopperIngot", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_arc_furnace,
        {
            name = "SandSurfaceSmelting",
            input = {
                {name = "SandSurface", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 20
            },
            output = {{name = "Glass", count = 1}},
            ticks = 100
        }
    )

    for _, material in pairs(materials) do
        if material.is_ingot then
            if material.smelt_level and material.smelt_level <= 3 then
                table.insert(
                    recipes_arc_furnace,
                    {
                        name = material.name .. "Ingot",
                        input = {
                            {name = material.name .. "Dust", count = 1}
                        },
                        res_input = {
                            name = "Electricity",
                            count = (material.name ~= "StainlessSteel") and 20 or 100
                        },
                        output = {
                            {name = material.name .. "Ingot", count = 1}
                        },
                        tier = extract_tier(material),
                        ticks = 200
                    }
                )
            end
        end
    end

    table.insert(
        recipes_macerator,
        {
            name = "Pumpkin",
            input = {
                {name = "Pumpkin", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "Organics", count = 1}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "Emerald",
            input = {
                {name = "Emerald", count = 1}
            },
            res_input = {name = "Kinetic", count = 50},
            output = {{name = "EmeraldDust", count = 1}},
            tier = 0,
            ticks = 100
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "MalachiteCrystal",
            input = {
                {name = "MalachiteCrystal", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "CopperOreDust", count = 2}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "MalachiteCluster",
            input = {
                {name = "MalachiteCluster", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "CopperOreDust", count = 5}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "RutileCrystal",
            input = {
                {name = "RutileCrystal", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "TitaniumOxideDust", count = 2}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "CinnabarCrystal",
            input = {
                {name = "CinnabarCrystal", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "CinnabarDust", count = 2}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "CinnabarCluster",
            input = {
                {name = "CinnabarCluster", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "CinnabarDust", count = 5}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "UraniniteCrystal",
            input = {
                {name = "UraniniteCrystal", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "UraniumDust", count = 2}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "UraniniteCluster",
            input = {
                {name = "UraniniteCluster", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {
                {name = "UraniumDust", count = 5},
                {name = "Uranium235Dust", count = 1}
            },
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_macerator,
        {
            name = "GravelToSand",
            input = {
                {name = "GravelSurface", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "SandSurface", count = 1}},
            tier = 0,
            ticks = 200
        }
    )

    table.insert(
        recipes_hammer,
        {
            name = "StoneToGravel",
            input = {
                {name = "StoneSurface", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "GravelSurface", count = 1}},
            tier = 0,
            ticks = 100
        }
    )

    table.insert(
        recipes_pump,
        {
            name = "Water",
            input = {},
            output = {},
            res_output = {name = "Water", count = 600},
            ticks = 6 * 20
        }
    )

    table.insert(
        recipes_indu,
        {
            name = "SpongeToIngot",
            input = {
                {name = "TitaniumSponge", count = 1}
            },
            res_input = {
                name = "Heat",
                count = 350
            },
            output = {
                {name = "TitaniumIngot", count = 1}
            },
            tier = 5,
            ticks = 200
        }
    )

    table.insert(
        recipes_indu,
        {
            name = "SuperconductorDust",
            input = {
                {name = "SuperconductorDust", count = 1}
            },
            res_input = {
                name = "Heat",
                count = 100
            },
            output = {
                {name = "SuperconductorIngot", count = 1}
            },
            tier = 5,
            ticks = 200
        }
    )

    table.insert(
        recipes_indu,
        {
            name = "TDustToIngot",
            input = {
                {name = "TitaniumDust", count = 1}
            },
            res_input = {
                name = "Heat",
                count = 350
            },
            output = {
                {name = "TitaniumIngot", count = 1}
            },
            tier = 5,
            ticks = 200
        }
    )

    table.insert(
        recipes_indu,
        {
            name = "HardMetalDustToIngot",
            input = {
                {name = "HardMetalDust", count = 1}
            },
            res_input = {
                name = "Heat",
                count = 900
            },
            output = {
                {name = "HotHardMetalIngot", count = 1}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_sep,
        {
            name = "SiliconOxide",
            input = {{name = "SandSurface", count = 2}},
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "SiliconOxide", count = 1}},
            ticks = 1000
        }
    )

    table.insert(
        recipes_mixer,
        {
            name = "Organics",
            input = {
                {name = "Organics", count = 1},
                {name = "Water", count = 500}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "Biomass", count = 500}},
            ticks = 200
        }
    )

    table.insert(
        recipes_mixer,
        {
            name = "HardMetalDust",
            input = {
                {name = "TungstenCarbideDust", count = 4},
                {name = "CobaltDust", count = 1}
            },
            res_input = {name = "Kinetic", count = 100},
            output = {{name = "HardMetalDust", count = 5}},
            ticks = 1000
        }
    )

    table.insert(
        recipes_mixer,
        {
            name = "SuperconductorDust",
            input = {
                {name = "GoldDust", count = 3},
                {name = "RareEarthElement", count = 1}
            },
            res_input = {name = "Kinetic", count = 100},
            output = {{name = "SuperconductorDust", count = 3}},
            ticks = 300
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "AluminiumOxideDust",
            input = {
                {name = "AluminiumOxideDust", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 50
            },
            output = {{name = "AluminiumDust", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "EmeraldDust",
            input = {
                {name = "EmeraldDust", count = 2}
            },
            res_input = {
                name = "Electricity",
                count = 70
            },
            output = {
                {name = "BerylliumDust", count = 1},
                {name = "AluminiumOxideDust", count = 1}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "AluminiumOreDust",
            input = {
                {name = "AluminiumOreDust", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 30
            },
            output = {{name = "AluminiumDust", count = 1}},
            ticks = 500
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "Clay",
            input = {
                {name = "Clay", count = 6}
            },
            res_input = {
                name = "Electricity",
                count = 1300
            },
            output = {
                {name = "SandSurface", count = 4},
                {name = "AluminiumOxideDust", count = 1},
                {name = "SodiumDust", count = 1}
            },
            ticks = 40
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "SandElectrolyze",
            input = {{name = "SiliconOxide", count = 1}},
            res_input = {name = "Electricity", count = 60},
            output = {{name = "Silicon", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "WaterElectrolyze",
            input = {{name = "Water", count = 100}},
            res_input = {name = "Electricity", count = 280},
            output = {
                {name = "Hydrogen", count = 100},
                {name = "Oxygen", count = 200}
            },
            ticks = 100
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "SaltElectrolyze",
            input = {
                {name = "SaltDust", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 10
            },
            output = {
                {name = "SodiumDust", count = 1},
                {name = "Chlorine", count = 1000}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "PotassiumChloride",
            input = {
                {name = "PotassiumChlorideDust", count = 1}
            },
            res_input = {
                name = "Electricity",
                count = 10
            },
            output = {
                {name = "PotassiumDust", count = 1},
                {name = "Chlorine", count = 1000}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_electrolyzer,
        {
            name = "Borax",
            input = {
                {name = "BoraxDust", count = 2}
            },
            res_input = {
                name = "Electricity",
                count = 50
            },
            output = {
                {name = "SodiumDust", count = 1},
                {name = "BoronDust", count = 1}
            },
            ticks = 200
        }
    )

    -- wood

    table.insert(
        recipes_cutter,
        {
            name = "LogCutting",
            input = {
                {name = "Log", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "Plank", count = 4}},
            ticks = 80
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "StoneLogCutting",
            input = {
                {name = "StoneLog", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "Plank", count = 4}},
            ticks = 200
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "CircuitBoard",
            input = {
                {name = "Plank", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "CircuitBoard", count = 1}},
            ticks = 80
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "StoneTiles",
            input = {{name = "StoneSurface", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "StoneTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "DarkTiles",
            input = {{name = "DarkStoneSurface", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "DarkTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "RedTiles",
            input = {{name = "RedStoneSurface", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "RedTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "Bricks",
            input = {{name = "StoneTiles", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "Bricks", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "RedBricks",
            input = {{name = "RedTiles", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "RedBricks", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "DarkBricks",
            input = {{name = "DarkTiles", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "DarkBricks", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "TerracottaTiles",
            input = {{name = "Terracotta", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "TerracottaTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "TerracottaBricks",
            input = {{name = "TerracottaTiles", count = 1}},
            res_input = {name = "Kinetic", count = 20},
            output = {{name = "TerracottaBricks", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "ConcreteTiles",
            input = {
                {name = "Concrete", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "ConcreteTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "ConcreteSmallTiles",
            input = {
                {name = "ConcreteTiles", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "ConcreteSmallTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "ConcreteBricks",
            input = {
                {name = "ConcreteSmallTiles", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "ConcreteBricks", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "ReinforcedConcreteTiles",
            input = {
                {name = "ReinforcedConcrete", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "ReinforcedConcreteTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "ReinforcedConcreteSmallTiles",
            input = {
                {name = "ReinforcedConcreteTiles", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "ReinforcedConcreteSmallTiles", count = 1}},
            ticks = 100
        }
    )
    table.insert(
        recipes_cutter,
        {
            name = "ReinforcedConcreteBricks",
            input = {
                {name = "ReinforcedConcreteSmallTiles", count = 1}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {{name = "ReinforcedConcreteBricks", count = 1}},
            ticks = 100
        }
    )
    -- burning

    table.insert(
        recipes_elfurn,
        {
            name = "Working",
            input = {},
            res_input = {
                name = "Electricity",
                count = 55
            },
            output = {},
            res_output = {
                name = "Heat",
                count = 50
            },
            ticks = 200,
            loss = 10
        }
    )

    table.insert(
        recipes_coil,
        {
            name = "Working",
            input = {},
            res_input = {name = "Electricity", count = 380},
            output = {},
            res_output = {
                name = "Heat",
                count = 342
            },
            ticks = 200,
            loss = 10
        }
    )

    table.insert(
        recipes_ferm,
        {
            name = "MethaneFromBiomass",
            input = {
                {name = "Biomass", count = 500}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "Methane", count = 500}},
            ticks = 200
        }
    )

    table.insert(
        recipes_ferm,
        {
            name = "MethaneFromPumpkin",
            input = {
                {name = "Pumpkin", count = 1}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "Methane", count = 200}},
            ticks = 200
        }
    )

    table.insert(
        recipes_radiator,
        {
            name = "Working",
            input = {},
            res_input = {
                name = "Heat",
                count = 500
            },
            output = {},
            ticks = 200
        }
    )

    table.insert(
        recipes_solar,
        {
            name = "Working",
            input = {},
            output = {},
            res_output = {
                name = "Electricity",
                count = 50
            },
            ticks = 60
        }
    )

    table.insert(
        recipes_riteg,
        {
            name = "Working",
            input = {},
            output = {},
            res_output = {
                name = "Heat",
                count = 500
            },
            ticks = 60
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "MineralWater",
            input = {
                {name = "MineralWater", count = 1000}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "SaltDust", count = 1}},
            ticks = 400
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "MineralWater3",
            input = {
                {name = "MineralWater", count = 1000}
            },
            res_input = {name = "Electricity", count = 60},
            output = {{name = "BoraxDust", count = 1, split = 10}},
            ticks = 100
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "MineralWater2",
            input = {
                {name = "MineralWater", count = 1000}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "PotassiumChlorideDust", count = 1}},
            ticks = 400
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "TungstenCarbideDust",
            input = {
                {name = "TungstenDust", count = 1},
                {name = "Coke", count = 2}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "TungstenCarbideDust", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "TitaniumTetrachloride",
            input = {
                {name = "PreparedTitaniumOxideDust", count = 1},
                {name = "Chlorine", count = 1000}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "TitaniumTetrachloride", count = 1000}},
            ticks = 200,
            scaled = false
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "TitaniumSponge",
            input = {
                {name = "TitaniumTetrachloride", count = 1000},
                {name = "AluminiumDust", count = 1}
            },
            res_input = {name = "Electricity", count = 10},
            output = {
                {name = "TitaniumSponge", count = 1}
            },
            ticks = 200,
            scaled = false
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "TungstenOxide",
            input = {
                {name = "TungstenOxideDust", count = 1},
                {name = "Hydrogen", count = 1000}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "TungstenDust", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "CobaltOxide",
            input = {
                {name = "CobaltOxideDust", count = 1},
                {name = "Hydrogen", count = 1000}
            },
            res_input = {name = "Electricity", count = 10},
            output = {{name = "CobaltDust", count = 1}},
            ticks = 200,
            scaled = false
        }
    )

    for _, i in pairs({"ProducerGas", "Methane", "Hydrogen", "Gasoline"}) do
        table.insert(
            recipes_gasturb,
            {
                input = {{name = i, count = 14 * 1000}},
                output = {},
                res_output = {
                    name = "Kinetic",
                    count = named_material(i).burnable.heat_per_tick * 14
                },
                ticks = named_material(i).burnable.burn_time,
                name = i
            }
        )

        table.insert(
            recipes_combustion,
            {
                name = i,
                input = {{name = i, count = 1000}},
                output = {},
                res_output = {
                    name = "Kinetic",
                    count = named_material(i).burnable.heat_per_tick
                },
                ticks = named_material(i).burnable.burn_time
            }
        )
    end

    table.insert(
        recipes_pyro,
        {
            name = "Coal",
            input = {
                {name = "Coal", count = 1}
            },
            res_input = {name = "Heat", count = 10},
            output = {
                {name = "Coke", count = 1},
                {name = "RawOil", count = 100},
                {name = "ProducerGas", count = 100}
            },
            ticks = 400
        }
    )

    table.insert(
        recipes_pyro,
        {
            name = "CoalSteam",
            input = {
                {name = "Coal", count = 1},
                {name = "Steam", count = 200}
            },
            res_input = {name = "Heat", count = 10},
            output = {
                {name = "Coke", count = 1},
                {name = "ProducerGas", count = 500}
            },
            ticks = 400
        }
    )

    table.insert(
        recipes_pyro,
        {
            name = "RawOil",
            input = {
                {name = "RawOil", count = 2000}
            },
            res_input = {name = "Heat", count = 15},
            output = {
                {name = "HeavyOil", count = 500},
                {name = "Gasoline", count = 100},
                {name = "Methane", count = 500}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_pyro,
        {
            name = "RawOilSteam",
            input = {
                {name = "RawOil", count = 1000 * 5},
                {name = "Steam", count = 1000}
            },
            res_input = {name = "Heat", count = 100},
            output = {
                {name = "HeavyOil", count = 150 * 2},
                {name = "Gasoline", count = 400 * 2},
                {name = "Methane", count = 500 * 2}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_pyro,
        {
            name = "HeavyOil",
            input = {
                {name = "HeavyOil", count = 1000},
                {name = "Steam", count = 200}
            },
            res_input = {name = "Heat", count = 10},
            output = {
                {name = "Gasoline", count = 750}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_pyro,
        {
            name = "Gasoline",
            input = {
                {name = "Gasoline", count = 1000},
                {name = "Steam", count = 200}
            },
            res_input = {name = "Heat", count = 10},
            output = {
                {name = "Methane", count = 750}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_pyro,
        {
            name = "Methane",
            input = {
                {name = "Methane", count = 800 * 5},
                {name = "Steam", count = 200 * 20}
            },
            res_input = {name = "Heat", count = 100},
            output = {
                {name = "ProducerGas", count = 1000 * 5}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_pyro,
        {
            name = "Methane2",
            input = {{name = "Methane", count = 800 * 5}},
            res_input = {name = "Heat", count = 50},
            output = {
                {name = "ProducerGas", count = 500 * 5}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "Ethylene",
            input = {
                {name = "ProducerGas", count = 1000},
                {
                    name = "Catalyst",
                    count = 1,
                    split = 0
                }
            },
            res_input = {name = "Electricity", count = 10},
            output = {
                {
                    name = "Ethylene",
                    count = 1000
                }
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "Sulfur",
            input = {
                {name = "HeavyOil", count = 150},
                {name = "Water", count = 250}
            },
            res_input = {name = "Electricity", count = 10},
            output = {
                {name = "Sulfur", count = 1}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "SulfuricAcid",
            input = {
                {name = "Sulfur", count = 1},
                {name = "Oxygen", count = 250},
                {name = "Water", count = 250}
            },
            res_input = {name = "Electricity", count = 10},
            output = {
                {name = "SulfuricAcid", count = 1000}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "Plastic1",
            input = {
                {name = "Ethylene", count = 1000},
                {name = "Coal", count = 1}
            },
            res_input = {name = "Electricity", count = 10},
            output = {
                {name = "Plastic", count = 1}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "Plastic2",
            input = {
                {name = "Ethylene", count = 1000},
                {name = "HeavyOil", count = 150}
            },
            res_input = {name = "Electricity", count = 10},
            output = {
                {name = "Plastic", count = 1}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_chem,
        {
            name = "ProducerGas",
            input = {
                {name = "ProducerGas", count = 1000}
            },
            res_input = {name = "Electricity", count = 10},
            output = {
                {name = "Hydrogen", count = 750}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_filtering_unit,
        {
            name = "OreWater",
            input = {
                {name = "OreWater", count = 500}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {
                {name = "Clay", count = 1}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_filtering_unit,
        {
            name = "OreWater2",
            input = {
                {name = "OreWater", count = 500},
                {name = "FilteringCell", count = 1, split = 10}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {
                {name = "AluminiumOreDust", count = 1, split = 2}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_filtering_unit,
        {
            name = "OreWater3",
            input = {
                {name = "OreWater", count = 500},
                {name = "FilteringCell", count = 1, split = 10}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {
                {name = "CopperOreDust", count = 1, split = 2}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_filtering_unit,
        {
            name = "OreWater4",
            input = {
                {name = "OreWater", count = 500},
                {name = "FilteringCell", count = 1, split = 10}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {
                {name = "UraniumOreDust", count = 1, split = 2}
            },
            ticks = 200
        }
    )

    table.insert(
        recipes_filtering_unit,
        {
            name = "OreWater5",
            input = {
                {name = "OreWater", count = 500},
                {name = "FilteringCell", count = 1, split = 10}
            },
            res_input = {name = "Kinetic", count = 10},
            output = {
                {name = "IronOreDust", count = 1, split = 2}
            },
            ticks = 200
        }
    )

    for _, i in pairs({"IronOreDust", "CopperOreDust"}) do
        table.insert(
            recipes_chemical_bath,
            {
                name = i,
                input = {
                    {name = "Mercury", count = 500},
                    {
                        name = i,
                        count = 2
                    }
                },
                res_input = {name = "Kinetic", count = 10},
                output = {
                    {
                        name = "GoldDust",
                        count = 1
                    }
                },
                ticks = 200
            }
        )
    end

    table.insert(
        recipes_chemical_bath,
        {
            name = "RareEarthElement",
            input = {
                {name = "AluminiumOreDust", count = 10},
                {name = "SulfuricAcid", count = 1000}
            },
            res_input = {name = "Kinetic", count = 30},
            output = {{name = "RareEarthElement", count = 1}},
            ticks = 1000
        }
    )

    table.insert(
        recipes_chemical_bath,
        {
            name = "CobaltOxideDust",
            input = {
                {name = "IronOreDust", count = 10},
                {name = "SulfuricAcid", count = 1000}
            },
            res_input = {name = "Kinetic", count = 30},
            output = {{name = "CobaltOxideDust", count = 1}},
            ticks = 1000
        }
    )

    table.insert(
        recipes_freezer,
        {
            name = "HotHardmetalIngot",
            input = {{name = "HotHardMetalIngot", count = 1}},
            res_input = {name = "Kinetic", count = 100},
            output = {{name = "HardMetalIngot", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_freezer,
        {
            name = "HotNeutroniumIngot",
            input = {{name = "HotNeutroniumIngot", count = 1}},
            res_input = {name = "Kinetic", count = 1000},
            output = {{name = "NeutroniumIngot", count = 1}},
            ticks = 200
        }
    )

    table.insert(
        recipes_computer,
        {
            name = "Computations",
            input = {},
            res_input = {name = "Electricity", count = 10},
            output = {{name = "Computations", count = 1}},
            ticks = 40
        }
    )

    table.insert(
        recipes_q_computer,
        {
            name = "QuantumComputations",
            input = {},
            res_input = {name = "Electricity", count = 100},
            output = {{name = "Computations", count = 40}},
            ticks = 40
        }
    )

    table.insert(
        recipes_portal,
        {
            name = "Ping",
            input = {},
            res_input = {
                name = "Electricity",
                count = 2 * fission_fullpower * 0.9 * 0.9
            },
            output = {{name = "MothershipPing", count = 1}},
            ticks = 1000
        }
    )

    append_recipe_hand_press(
        {
            name = "Column",
            input = {{name = "StoneSurface", count = 1}},
            output = {{name = "Column", count = 1}},
            ticks = 20
        }
    )

    append_recipe_hand_press(
        {
            name = "FluetedColumn",
            input = {{name = "Column", count = 1}},
            output = {{name = "FluetedColumn", count = 1}},
            ticks = 20
        }
    )

    append_recipe_hand_press(
        {
            name = "GlassBlock",
            input = {{name = "Glass", count = 1}},
            output = {{name = "GlassBlock", count = 1}},
            ticks = 10
        }
    )

    append_recipe_hand_press(
        {
            name = "PlasticBlock",
            input = {{name = "Plastic", count = 1}},
            output = {{name = "PlasticBlock", count = 1}},
            ticks = 10
        }
    )

    append_recipe_hand_press(
        {
            name = "DangerBlock",
            input = {{name = "Concrete", count = 1}},
            output = {{name = "DangerBlock", count = 1}},
            ticks = 20
        }
    )

    append_recipe_hand_press(
        {
            name = "BasicPlatform",
            input = {{name = "SandSurface", count = 1}},
            output = {{name = "BasicPlatform", count = 1}},
            ticks = 10
        }
    )

    append_recipe_hand_press(
        {
            name = "RustyCopperCasing",
            input = {{name = "CopperCasing", count = 1}},
            output = {{name = "RustyCopperCasing", count = 1}},
            ticks = 20
        }
    )

    append_recipe_hand_press(
        {
            name = "RustyIronCasing",
            input = {{name = "SteelCasing", count = 1}},
            output = {{name = "RustyIronCasing", count = 1}},
            ticks = 20
        }
    )

    for _, i in pairs(
        {
            "Circuit",
            "AdvancedCircuit",
            "Processor",
            "QuantumCircuit",
            "QuantumProcessor",
            "QuantumBrain"
        }
    ) do
        table.insert(
            recipes_computer,
            {
                name = i,
                input = {{name = i, count = 1}},
                res_input = {name = "Electricity", count = 40},
                output = {{name = i, count = 1}},
                ticks = 40
            }
        )
    end

    --
    --
    --
    --

    for _, pair in pairs(
        {
            {"Multitool", recipes_wrench},
            {"BlastFurnace", recipes_blast_furnace},
            {"Oven", recipes_oven},
            {"Smelter", recipes_smelter},
            {"Macerator", recipes_macerator},
            {"Boiler", recipes_boiler},
            {"Generator", recipes_generator},
            {"ElectricEngine", recipes_electric_engine},
            {"StirlingEngine", recipes_steam_engine},
            {"Pump", recipes_pump},
            {"Separator", recipes_sep},
            {"IndustrialSeparator", recipes_sep2},
            {"Press", recipes_press},
            {"ArcSmelter", recipes_arc_furnace},
            {"SteamTurbine", recipes_steam_turbine},
            {"Electrolyzer", recipes_electrolyzer},
            {"CuttingMachine", recipes_cutter},
            {"Furnace", recipes_furnace},
            {"ElectricFurnace", recipes_elfurn},
            {"Fermenter", recipes_ferm},
            {"MultitoolRobotArm", recipes_toolarm},
            {"AutomaticHammer", recipes_hammer},
            {"Mixer", recipes_mixer},
            {"Radiator", recipes_radiator},
            {"SolarPanel", recipes_solar},
            {"ChemReactor", recipes_chem},
            {"InductionCoil", recipes_coil},
            {"IndustrialSmelter", recipes_indu},
            {"HeatExchanger", recipes_exch},
            {"InverseHeatExchanger", recipes_iexch},
            {"Freezer", recipes_freezer},
            {"CombustionEngine", recipes_combustion},
            {"PyrolysisUnit", recipes_pyro},
            {"Computer", recipes_computer},
            {"CompactGenerator", recipes_compact_generator},
            {"FissionReactor", recipes_fission},
            {"AutomaticFarm", recipes_farm},
            {"AtmosphericCondenser", recipes_condens},
            {"Assembler", recipes_assembler},
            {"GasTurbine", recipes_gasturb},
            {"FilteringUnit", recipes_filtering_unit},
            {"Portal", recipes_portal},
            {"ChemicalBath", recipes_chemical_bath},
            {"Riteg", recipes_riteg},
            {"IndustrialSteamTurbine", recipes_industrial_steam_turbine},
            {"FusionReactor", recipes_fusion_reactor},
            {"IndustrialBoiler", recipes_industrial_boiler},
            {"IndustrialElectricEngine", recipes_industrial_electric_engine},
            {"Hand", recipes_hand}
        }
    ) do
        local rd = RecipeDictionary.get(pair[1])
        append_recipe_array(rd, pair[2])
    end
end
