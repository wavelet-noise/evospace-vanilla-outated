machines = {
    {
        name = "Macerator",
        label = "Macerator",
        start_tier = 1,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end, 
        description = {"KineticInput"}
    },
    {
        name = "CuttingMachine",
        label = "Cutting Machine",
        start_tier = 1,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    -- ,{
    -- 	name = "RollerMachine",
    -- 	label = "Roller Machine",
    --
    -- 	start_tier = 2,
    -- 	end_tier = 4,
    -- 	description = "Unused.",
    -- }
    {
        name = "Fermenter",
        label = "Fermenter",
        start_tier = 4,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, 0, 1)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        required_researches = {"Fermentation"},
        description = {"ElectricInput"}
    },
    {
        name = "ChemReactor",
        label = "Chemical Reactor",
        start_tier = 2,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput"}
    },
    {
        name = "Separator",
        label = "Separator",
        start_tier = 2,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    {
        name = "Beam",
        label = "Beam",
        start_tier = 1,
        end_tier = 10,
        logic = "TieredBlock",
        tag = "Decoration",
        description = {"BuildingBlock"}
    },
    {
        name = "Corner",
        label = "Corner",
        start_tier = 1,
        end_tier = 10,
        logic = "TieredBlock",
        tag = "Decoration",
        description = {"BuildingBlock"}
    },
    {
        name = "AutomaticHammer",
        label = "Automatic Hammer",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, 0, 1)
        },
        start_tier = 1,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    -- ,{
    -- 	name = "Lathe",
    -- 	label = "Lathe",
    --
    -- 	start_tier = 2,
    -- 	end_tier = 7,
    -- 	description = "Unused.",
    -- }
    {
        name = "Boiler",
        label = "Boiler",
        start_tier = 2,
        end_tier = 10,
        common_text_keys = {"AutoCrafter"},
        logic = "FissionReactor",
        block_creation = function(crafter)
            local heat_input = Class.find("HeatInputAccessor")
            local fluid_input = Class.find("FluidInputAccessor")
            local fluid_output = Class.find("FluidOutputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(fluid_output)
            a:set_side_pos(Vec3i.up(), Vec3i.zero())
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"HeatInput", "FluidInput", "FluidOutput", "PowerOutput"},
        custom_data = {
            storage_force_capacity = 30000,
            storage_drain = 0
        },
        power_output = 100
    },
    {
        name = "Pipe",
        label = "Pipe",
        start_tier = 1,
        end_tier = 10,
        logic = "FluidConductor",
        tag = "Logistics",
        description = {"FluidConductor"},
        path_finding = true
    },
    {
        name = "HeatPipe",
        label = "Heat Pipe",
        start_tier = 1,
        end_tier = 1,
        logic = "HeatConductor",
        tag = "Logistics",
        description = {"HeatConductor", "HeatStorage"},
        path_finding = true
    },
    {
        name = "Flywheel",
        label = "Flywheel",
        start_tier = 2,
        end_tier = 2,
        logic = "KineticConductor",
        tag = "Logistics",
        description = {"KineticConductor", "KineticStorage"},
        path_finding = true
    },
    {
        name = "Scaffold",
        label = "Scaffold",
        start_tier = 1,
        end_tier = 10,
        tag = "Decoration",
        logic = "TieredBlock",
        description = {"BuildingBlock"}
    },
    {
        name = "Sign",
        label = "Sign",
        tag = "Decoration",
        start_tier = 0,
        end_tier = 10,
        logic = "SignBlock"
    },
    {
        name = "AdvancedSign",
        label = "Advanced Sign",
        tag = "Decoration",
        start_tier = 2,
        end_tier = 10,
        logic = "SignBlock"
    },
    {
        name = "Cable",
        label = "Cable",
        start_tier = 1,
        end_tier = 1,
        logic = "ElectricConductor",
        tag = "Logistics",
        path_finding = true
    },
    {
        name = "Chest",
        label = "Chest",
        logic = "Chest",
        start_tier = 0,
        end_tier = 10,
        tag = "Logistics"
    },
    {
        name = "ItemRack",
        label = "Item Rack",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1)
        },
        logic = "ItemRack",
        start_tier = 1,
        end_tier = 10,
        tag = "Logistics"
    },
    {
        name = "Valve",
        label = "Valve",
        start_tier = 1,
        end_tier = 1,
        common_text_keys = {"Valve"},
        logic = "FluidSwitch",
        tag = "Logistics",
        description = {"FluidConductor"}
    },
    {
        name = "Switch",
        label = "Switch",
        start_tier = 2,
        end_tier = 2,
        logic = "ElectricSwitch",
        tag = "Logistics",
        description = {"ElectricConductor"}
    },
    {
        name = "OreWasher",
        label = "Ore Washer",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-2, 1, 1)
        },
        start_tier = 2,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 1, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    {
        name = "Conveyor",
        label = "Conveyor",
        logic = "Conveyor",
        start_tier = 1,
        end_tier = 10,
        common_text_keys = {"Conveyor", "Transporter"},
        selector = "/Game/Blocks/ArrowConvBP.ArrowConvBP_C",
        tag = "Logistics",
        path_finding = true
    },
    {
        name = "Splitter",
        label = "Splitter",
        logic = "Splitter",
        start_tier = 1,
        end_tier = 10,
        description = {"Splitter"},
        tag = "Logistics"
    },
    {
        name = "Sorter",
        label = "Sorter",
        logic = "Sorter",
        start_tier = 2,
        end_tier = 10,
        description = {"Splitter", "Sorter"},
        tag = "Logistics"
    },
    {
        name = "Container",
        label = "Container",
        start_tier = 1,
        end_tier = 10,
        logic = "FluidContainer",
        tag = "Logistics",
        description = {"FluidConductor", "FluidStorage"}
    },
    {
        name = "Press",
        label = "Press",
        start_tier = 2,
        end_tier = 10,
        common_text_keys = {"Press", "AutoCrafter"},
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end
    },
    -- ,{
    -- 	name = "Compressor",
    -- 	label = "Compressor",
    -- 	start_tier = 2,
    -- 	end_tier = 10,
    -- 	common_text_keys =[
    -- 		"AutoCrafter"
    -- 	],
    -- 	block_logic =""SelectCrafter"",
    -- 	block_creation ="""
    -- 	local crafter = current_block_logic()
    --
    -- 	local a = crafter:create_accessor(ElectricInputAccessor))
    -- 	a:set_side_pos(Vec3i.left(), Vec3i.zero())
    -- 	a:bind(crafter.input_container)
    --
    -- 	local a = crafter:create_accessor(FluidOutputAccessor))
    -- 	a:set_side_pos(Vec3i.right(), Vec3i.zero())
    -- 	a:bind(crafter.output_container)
    -- 	end,
    --
    -- }
    {
        name = "StirlingEngine",
        label = "Stirling Engine",
        start_tier = 1,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local heat_input = Class.find("HeatInputAccessor")
            local kinetic_output = Class.find("KineticOutputAccessor")

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(kinetic_output)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.output_container)
        end,
        description = {"HeatInput", "KineticOutput", "PowerOutput"},
        power_output = 10
    },
    {
        name = "CombustionEngine",
        label = "Combustion Engine",
        logic = "AutoCrafter",
        start_tier = 2,
        end_tier = 10,
        description = {"FluidInput", "KineticOutput"}
    },
    {
        name = "PyrolysisUnit",
        label = "Pyrolysis Unit",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(0, 1, 0),
            Vec3i.new(0, 2, 0)
        },
        start_tier = 3,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local heat_input = Class.find("HeatInputAccessor")

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(0, 0, 0))
            a:bind(crafter.input_container)
        end,
        description = {"HeatInput"}
    },
    {
        name = "Generator",
        label = "Generator",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1)
        },
        start_tier = 2,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")
            local electric_output = Class.find("ElectricOutputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-1, 1, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_output)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.output_container)
        end,
        description = {"KineticInput", "ElectricOutput", "PowerOutput"},
        power_output = 243
    },
    {
        name = "CompactGenerator",
        label = "Compact Generator",
        start_tier = 1,
        end_tier = 1,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")
            local electric_output = Class.find("ElectricOutputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_output)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.output_container)
        end,
        description = {"KineticInput", "ElectricOutput", "PowerOutput"},
        power_output = 18
    },
    {
        name = "ElectricEngine",
        label = "Electric Engine",
        start_tier = 2,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_output = Class.find("KineticOutputAccessor")
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(kinetic_output)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.down(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput", "KineticOutput", "PowerOutput"},
        power_output = 55
    },
    {
        name = "IndustrialElectricEngine",
        label = "Industrial Electric Engine",
        start_tier = 4,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(1, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(1, 1, 1)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_output = Class.find("KineticOutputAccessor")
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(kinetic_output)
            a:set_side_pos(Vec3i.front(), Vec3i.new(1, 0, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.down(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.right(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput", "KineticOutput", "PowerOutput"},
        power_output = 55 * 50
    },
    {
        name = "RobotArm",
        label = "Robot Arm",
        logic = "RobotArm",
        start_tier = 1,
        end_tier = 10,
        selector = "/Game/Blocks/ArrowBP.ArrowBP_C",
        tag = "Logistics"
    },
    {
        name = "FilteringRobotArm",
        label = "Filtering Robot Arm",
        start_tier = 1,
        logic = "FilteringRobotArm",
        end_tier = 10,
        selector = "/Game/Blocks/ArrowBP.ArrowBP_C",
        tag = "Logistics",
        description = {"Sorter"}
    },
    {
        name = "Pump",
        label = "Pump",
        logic = "Pump",
        start_tier = 1,
        end_tier = 10,
        tag = "Logistics",
        selector = "/Game/Blocks/ArrowBP.ArrowBP_C",
        description = {"FluidInput", "FluidOutput"}
    },
    {
        name = "FilteringPump",
        label = "Filtering Pump",
        logic = "FilteringPump",
        start_tier = 1,
        end_tier = 10,
        tag = "Logistics",
        selector = "/Game/Blocks/ArrowBP.ArrowBP_C",
        description = {"Sorter", "FluidInput", "FluidOutput"}
    },
    {
        name = "Smelter",
        label = "Smelter",
        start_tier = 0,
        end_tier = 2,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local heat_input = Class.find("HeatInputAccessor")

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"HeatInput"},
        custom_data = {force_capacity = 32}
    },
    {
        name = "SteamTurbine",
        label = "Steam Turbine",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1)
        },
        start_tier = 2,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_output = Class.find("KineticOutputAccessor")
            local fluid_input = Class.find("FluidInputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.up(), Vec3i.new(0, 0, 1))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(kinetic_output)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.output_container)
        end,
        description = {"FluidInput", "KineticOutput", "PowerOutput"},
        power_output = 270
    },
    {
        name = "IndustrialSteamTurbine",
        label = "Industrial Steam Turbine",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(-4, 0, 0),
            Vec3i.new(-5, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(-4, -1, 0),
            Vec3i.new(-5, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(-3, -2, 0),
            Vec3i.new(-4, -2, 0),
            Vec3i.new(-5, -2, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(-4, 0, 1),
            Vec3i.new(-5, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1),
            Vec3i.new(-4, -1, 1),
            Vec3i.new(-5, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1),
            Vec3i.new(-3, -2, 1),
            Vec3i.new(-4, -2, 1),
            Vec3i.new(-5, -2, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(-3, 0, 2),
            Vec3i.new(-4, 0, 2),
            Vec3i.new(-5, 0, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(-3, -1, 2),
            Vec3i.new(-4, -1, 2),
            Vec3i.new(-5, -1, 2),
            Vec3i.new(0, -2, 2),
            Vec3i.new(-1, -2, 2),
            Vec3i.new(-2, -2, 2),
            Vec3i.new(-3, -2, 2),
            Vec3i.new(-4, -2, 2),
            Vec3i.new(-5, -2, 2)
        },
        start_tier = 5,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local fluid_input = Class.find("FluidInputAccessor")
            local electric_output = Class.find("ElectricOutputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_output)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-5, -1, 0))
            a:bind(crafter.output_container)
        end,
        description = {"FluidInput", "ElectricOutput", "PowerOutput"},
        power_output = fission_fullpower * 0.9 * 0.9
    },
    {
        name = "GasTurbine",
        label = "Gas Turbine",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1)
        },
        start_tier = 4,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local kinetic_output = Class.find("KineticOutputAccessor")
            local fluid_input = Class.find("FluidInputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.up(), Vec3i.new(-2, 0, 1))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-1, -1, 1))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(kinetic_output)
            a:set_side_pos(Vec3i.right(), Vec3i.new(-3, -1, 0))
            a:bind(crafter.output_container)
        end,
        description = {"FluidInput", "KineticOutput"}
    },
    {
        name = "Riteg",
        label = "RTG",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(1, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(1, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(1, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(1, -1, 1)
        },
        start_tier = 5,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local heat_output = Class.find("HeatOutputAccessor")

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.down(), Vec3i.new(0, 0, 0))
            a:bind(crafter.output_container)

            a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.up(), Vec3i.new(0, 0, 1))
            a:bind(crafter.output_container)
        end,
        description = {"HeatOutput", "PowerOutput"},
        power_output = 500
    },
    {
        name = "ArcSmelter",
        label = "Arc Smelter",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2)
        },
        start_tier = 2,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-1, 1, 0))
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput"}
    },
    {
        name = "ChemicalBath",
        label = "Chemical Bath",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1)
        },
        start_tier = 3,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    {
        name = "Sifter",
        label = "Sifter",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1)
        },
        start_tier = 3,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    {
        name = "FilteringUnit",
        label = "Filtering Unit",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1)
        },
        start_tier = 3,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    {
        name = "Furnace",
        label = "Furnace",
        start_tier = 0,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local heat_output = Class.find("HeatOutputAccessor")

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.up(), Vec3i.zero())
            a:bind(crafter.output_container)
        end,
        description = {"HeatOutput"}
    },
    {
        name = "Oven",
        label = "Oven",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2)
        },
        start_tier = 1,
        end_tier = 10,
        logic = "AutoCrafter",
        description = {"SpeedBonus"}
    },
    {
        name = "BlastFurnace",
        label = "Blast Furnace",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(0, 0, 3),
            Vec3i.new(-1, 0, 3),
            Vec3i.new(-2, 0, 3),
            Vec3i.new(0, 1, 3),
            Vec3i.new(-1, 1, 3),
            Vec3i.new(-2, 1, 3),
            Vec3i.new(0, -1, 3),
            Vec3i.new(-1, -1, 3),
            Vec3i.new(-2, -1, 3)
        },
        start_tier = 1,
        end_tier = 10,
        logic = "SelectCrafter",
        description = {"SpeedBonus"}
    },
    {
        name = "FluidFurnace",
        label = "Fluid Furnace",
        start_tier = 1,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local heat_output = Class.find("HeatOutputAccessor")
            local fluid_input = Class.find("FluidInputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.up(), Vec3i.zero())
            a:bind(crafter.output_container)
        end,
        description = {"FluidInput", "HeatOutput"}
    },
    {
        name = "ElectricFurnace",
        label = "Electric Furnace",
        start_tier = 2,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local heat_output = Class.find("HeatOutputAccessor")
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.up(), Vec3i.zero())
            a:bind(crafter.output_container)
        end,
        description = {"ElectricInput", "HeatOutput", "PowerOutput"},
        power_output = 40
    },
    {
        name = "BatteryBox",
        label = "Battery Box",
        start_tier = 4,
        end_tier = 10,
        description = {"ElectricConductor", "ElectricStorage"},
        custom_data = {
            base_capacity = 1000000,
            bonus_capacity = 1000000
        },
        logic = "BatteryBox"
    },
    {
        name = "SmallBattery",
        label = "Small Battery",
        start_tier = 3,
        end_tier = 10,
        description = {"ElectricConductor", "ElectricStorage"},
        logic = "BatteryBox",
        custom_data = {
            base_capacity = 100000,
            bonus_capacity = 100000
        }
    },
    {
        name = "Portal",
        label = "Portal",
        start_tier = 7,
        end_tier = 10,
        logic = "Portal",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(-4, 0, 0),
            Vec3i.new(-5, 0, 0),
            Vec3i.new(-6, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(-3, 1, 0),
            Vec3i.new(-4, 1, 0),
            Vec3i.new(-5, 1, 0),
            Vec3i.new(-6, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(-4, -1, 0),
            Vec3i.new(-5, -1, 0),
            Vec3i.new(-6, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(-3, -2, 0),
            Vec3i.new(-4, -2, 0),
            Vec3i.new(-5, -2, 0),
            Vec3i.new(-6, -2, 0),
            Vec3i.new(0, -3, 0),
            Vec3i.new(-1, -3, 0),
            Vec3i.new(-2, -3, 0),
            Vec3i.new(-3, -3, 0),
            Vec3i.new(-4, -3, 0),
            Vec3i.new(-5, -3, 0),
            Vec3i.new(-6, -3, 0),
            Vec3i.new(0, -4, 0),
            Vec3i.new(-1, -4, 0),
            Vec3i.new(-2, -4, 0),
            Vec3i.new(-3, -4, 0),
            Vec3i.new(-4, -4, 0),
            Vec3i.new(-5, -4, 0),
            Vec3i.new(-6, -4, 0),
            Vec3i.new(0, -5, 0),
            Vec3i.new(-1, -5, 0),
            Vec3i.new(-2, -5, 0),
            Vec3i.new(-3, -5, 0),
            Vec3i.new(-4, -5, 0),
            Vec3i.new(-5, -5, 0),
            Vec3i.new(-6, -5, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(-4, 0, 1),
            Vec3i.new(-5, 0, 1),
            Vec3i.new(-6, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(-3, 1, 1),
            Vec3i.new(-4, 1, 1),
            Vec3i.new(-5, 1, 1),
            Vec3i.new(-6, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1),
            Vec3i.new(-4, -1, 1),
            Vec3i.new(-5, -1, 1),
            Vec3i.new(-6, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1),
            Vec3i.new(-3, -2, 1),
            Vec3i.new(-4, -2, 1),
            Vec3i.new(-5, -2, 1),
            Vec3i.new(-6, -2, 1),
            Vec3i.new(0, -3, 1),
            Vec3i.new(-1, -3, 1),
            Vec3i.new(-2, -3, 1),
            Vec3i.new(-3, -3, 1),
            Vec3i.new(-4, -3, 1),
            Vec3i.new(-5, -3, 1),
            Vec3i.new(-6, -3, 1),
            Vec3i.new(0, -4, 1),
            Vec3i.new(-1, -4, 1),
            Vec3i.new(-2, -4, 1),
            Vec3i.new(-3, -4, 1),
            Vec3i.new(-4, -4, 1),
            Vec3i.new(-5, -4, 1),
            Vec3i.new(-6, -4, 1),
            Vec3i.new(0, -5, 1),
            Vec3i.new(-1, -5, 1),
            Vec3i.new(-2, -5, 1),
            Vec3i.new(-3, -5, 1),
            Vec3i.new(-4, -5, 1),
            Vec3i.new(-5, -5, 1),
            Vec3i.new(-6, -5, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(-3, 0, 2),
            Vec3i.new(-4, 0, 2),
            Vec3i.new(-5, 0, 2),
            Vec3i.new(-6, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(-3, 1, 2),
            Vec3i.new(-4, 1, 2),
            Vec3i.new(-5, 1, 2),
            Vec3i.new(-6, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(-3, -1, 2),
            Vec3i.new(-4, -1, 2),
            Vec3i.new(-5, -1, 2),
            Vec3i.new(-6, -1, 2),
            Vec3i.new(0, -2, 2),
            Vec3i.new(-1, -2, 2),
            Vec3i.new(-2, -2, 2),
            Vec3i.new(-3, -2, 2),
            Vec3i.new(-4, -2, 2),
            Vec3i.new(-5, -2, 2),
            Vec3i.new(-6, -2, 2),
            Vec3i.new(0, -3, 2),
            Vec3i.new(-1, -3, 2),
            Vec3i.new(-2, -3, 2),
            Vec3i.new(-3, -3, 2),
            Vec3i.new(-4, -3, 2),
            Vec3i.new(-5, -3, 2),
            Vec3i.new(-6, -3, 2),
            Vec3i.new(0, -4, 2),
            Vec3i.new(-1, -4, 2),
            Vec3i.new(-2, -4, 2),
            Vec3i.new(-3, -4, 2),
            Vec3i.new(-4, -4, 2),
            Vec3i.new(-5, -4, 2),
            Vec3i.new(-6, -4, 2),
            Vec3i.new(0, -5, 2),
            Vec3i.new(-1, -5, 2),
            Vec3i.new(-2, -5, 2),
            Vec3i.new(-3, -5, 2),
            Vec3i.new(-4, -5, 2),
            Vec3i.new(-5, -5, 2),
            Vec3i.new(-6, -5, 2),
            Vec3i.new(0, 0, 3),
            Vec3i.new(-1, 0, 3),
            Vec3i.new(-2, 0, 3),
            Vec3i.new(-3, 0, 3),
            Vec3i.new(-4, 0, 3),
            Vec3i.new(-5, 0, 3),
            Vec3i.new(-6, 0, 3),
            Vec3i.new(0, 1, 3),
            Vec3i.new(-1, 1, 3),
            Vec3i.new(-2, 1, 3),
            Vec3i.new(-3, 1, 3),
            Vec3i.new(-4, 1, 3),
            Vec3i.new(-5, 1, 3),
            Vec3i.new(-6, 1, 3),
            Vec3i.new(0, -1, 3),
            Vec3i.new(-1, -1, 3),
            Vec3i.new(-2, -1, 3),
            Vec3i.new(-3, -1, 3),
            Vec3i.new(-4, -1, 3),
            Vec3i.new(-5, -1, 3),
            Vec3i.new(-6, -1, 3),
            Vec3i.new(0, -2, 3),
            Vec3i.new(-1, -2, 3),
            Vec3i.new(-2, -2, 3),
            Vec3i.new(-3, -2, 3),
            Vec3i.new(-4, -2, 3),
            Vec3i.new(-5, -2, 3),
            Vec3i.new(-6, -2, 3),
            Vec3i.new(0, -3, 3),
            Vec3i.new(-1, -3, 3),
            Vec3i.new(-2, -3, 3),
            Vec3i.new(-3, -3, 3),
            Vec3i.new(-4, -3, 3),
            Vec3i.new(-5, -3, 3),
            Vec3i.new(-6, -3, 3),
            Vec3i.new(0, -4, 3),
            Vec3i.new(-1, -4, 3),
            Vec3i.new(-2, -4, 3),
            Vec3i.new(-3, -4, 3),
            Vec3i.new(-4, -4, 3),
            Vec3i.new(-5, -4, 3),
            Vec3i.new(-6, -4, 3),
            Vec3i.new(0, -5, 3),
            Vec3i.new(-1, -5, 3),
            Vec3i.new(-2, -5, 3),
            Vec3i.new(-3, -5, 3),
            Vec3i.new(-4, -5, 3),
            Vec3i.new(-5, -5, 3),
            Vec3i.new(-6, -5, 3),
            Vec3i.new(0, 0, 3),
            Vec3i.new(-1, 0, 3),
            Vec3i.new(-2, 0, 3),
            Vec3i.new(-3, 0, 3),
            Vec3i.new(-4, 0, 3),
            Vec3i.new(-5, 0, 3),
            Vec3i.new(-6, 0, 4),
            Vec3i.new(0, 1, 3),
            Vec3i.new(-1, 1, 3),
            Vec3i.new(-2, 1, 3),
            Vec3i.new(-3, 1, 3),
            Vec3i.new(-4, 1, 3),
            Vec3i.new(-5, 1, 3),
            Vec3i.new(-6, 1, 4),
            Vec3i.new(0, -1, 3),
            Vec3i.new(-1, -1, 3),
            Vec3i.new(-2, -1, 3),
            Vec3i.new(-3, -1, 3),
            Vec3i.new(-4, -1, 3),
            Vec3i.new(-5, -1, 3),
            Vec3i.new(-6, -1, 4),
            Vec3i.new(0, -2, 3),
            Vec3i.new(-1, -2, 3),
            Vec3i.new(-2, -2, 3),
            Vec3i.new(-3, -2, 3),
            Vec3i.new(-4, -2, 3),
            Vec3i.new(-5, -2, 3),
            Vec3i.new(-6, -2, 4),
            Vec3i.new(0, -3, 3),
            Vec3i.new(-1, -3, 3),
            Vec3i.new(-2, -3, 3),
            Vec3i.new(-3, -3, 3),
            Vec3i.new(-4, -3, 3),
            Vec3i.new(-5, -3, 3),
            Vec3i.new(-6, -3, 4),
            Vec3i.new(0, -4, 3),
            Vec3i.new(-1, -4, 3),
            Vec3i.new(-2, -4, 3),
            Vec3i.new(-3, -4, 3),
            Vec3i.new(-4, -4, 3),
            Vec3i.new(-5, -4, 3),
            Vec3i.new(-6, -4, 4),
            Vec3i.new(0, -5, 3),
            Vec3i.new(-1, -5, 3),
            Vec3i.new(-2, -5, 3),
            Vec3i.new(-3, -5, 3),
            Vec3i.new(-4, -5, 3),
            Vec3i.new(-5, -5, 3),
            Vec3i.new(-6, -5, 4)
        },
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 1, 1))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.left(), Vec3i.new(0, 1, 1))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, -5, 1))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.right(), Vec3i.new(0, -5, 1))
            a:bind(crafter.input_container)
        end
    },
    -- {
    -- 	name = "MoltenSaltBattery",
    -- 	label = "Molten Salt Battery",
    -- 	start_tier = 5,
    -- 	end_tier = 10,
    -- 	block_logic = "HighcapElectricBattery",
    -- }
    {
        name = "DrillingRig",
        label = "Drilling Rig",
        logic = "DrillingRig",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(0, 0, 3),
            Vec3i.new(-1, 0, 3),
            Vec3i.new(-2, 0, 3),
            Vec3i.new(0, 1, 3),
            Vec3i.new(-1, 1, 3),
            Vec3i.new(-2, 1, 3),
            Vec3i.new(0, -1, 3),
            Vec3i.new(-1, -1, 3),
            Vec3i.new(-2, -1, 3),
            Vec3i.new(0, 0, 4),
            Vec3i.new(-1, 0, 4),
            Vec3i.new(-2, 0, 4),
            Vec3i.new(0, 1, 4),
            Vec3i.new(-1, 1, 4),
            Vec3i.new(-2, 1, 4),
            Vec3i.new(0, -1, 4),
            Vec3i.new(-1, -1, 4),
            Vec3i.new(-2, -1, 4)
        },
        start_tier = 1,
        end_tier = 10,
        description = {"KineticInput", "ItemOutput"}
    },
    {
        name = "Assembler",
        label = "Assembler",
        start_tier = 1,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput"}
    },
    {
        name = "Constructor",
        label = "Constructor",
        start_tier = 2,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput"}
    },
    {
        name = "Deconstructor",
        label = "Deconstructor",
        start_tier = 2,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1)
        },
        logic = "DeconstructorCrafter",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput"}
    },
    {
        name = "FluidDump",
        label = "Fluid Dump",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(0, 2, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-1, 2, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(-2, 2, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(-3, -2, 0),
            Vec3i.new(-3, 1, 0),
            Vec3i.new(-3, 2, 0),
            Vec3i.new(-4, 0, 0),
            Vec3i.new(-4, -1, 0),
            Vec3i.new(-4, -2, 0),
            Vec3i.new(-4, 1, 0),
            Vec3i.new(-4, 2, 0)
        },
        start_tier = 1,
        end_tier = 10,
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local fluid_input = Class.find("FluidInputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"FluidInput"}
    },
    {
        name = "GasDump",
        label = "Gas Dump",
        sub_blocks = {Vec3i.new(0, 0, 0)},
        start_tier = 2,
        end_tier = 2,
        logic = "DumpCrafter",
        block_creation = function(crafter)
            local fluid_input = Class.find("FluidInputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.down(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"FluidInput"}
    },
    {
        name = "SolidDump",
        label = "Solid Dump",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0)
        },
        start_tier = 2,
        end_tier = 2,
        logic = "DumpAnyCrafter",
        description = {"SolidInput"}
    },
    -- ,{
    -- 	"name" then "Liquifier",
    -- 	"Label" then "Liquifier",
    -- 	start_tier = 2,
    -- 	end_tier = 3,
    -- 	description = ""
    -- }
    {
        name = "Lamp",
        label = "Lamp",
        start_tier = 1,
        end_tier = 10,
        logic = "LampLogic"
    },
    {
        name = "AdminElectricGenerator",
        label = "Creative Electric Generator",
        logic = "LuaBlock",
        start_tier = 7,
        end_tier = 7,
        craftable = false,
        description = {"ElectricOutput"},
        tick = function(self, self_static)
            print(123)
        end
    },
    {
        name = "CreativeItemGenerator",
        label = "Creative Item Generator",
        logic = "LuaBlock",
        start_tier = 7,
        end_tier = 7,
        craftable = false,
        description = {"ItemOutput"}
    },
    {
        name = "CreativeKineticGenerator",
        label = "Creative Kinetic Generator",
        logic = "LuaBlock",
        start_tier = 7,
        end_tier = 7,
        craftable = false,
        description = {"KineticOutput"}
    },
    {
        name = "CreativeHeatGenerator",
        label = "Creative Heat Generator",
        logic = "LuaBlock",
        start_tier = 7,
        end_tier = 7,
        craftable = false,
        description = {"HeatOutput"}
    },
    {
        name = "CreativeFluidGenerator",
        logic = "LuaBlock",
        label = "Creative Fluid Generator",
        start_tier = 7,
        end_tier = 7,
        craftable = false,
        description = {"FluidOutput"}
    },
    {
        name = "CreativeExterminator",
        logic = "LuaBlock",
        label = "Creative Exterminator",
        start_tier = 7,
        end_tier = 7,
        craftable = false,
        description = {
            "KineticInput",
            "HeatInput",
            "FluidInput",
            "ItemInput",
            "KineticInput"
        }
    },
    {
        name = "Electrolyzer",
        label = "Electrolyzer",
        start_tier = 2,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.back(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"ElectricInput"}
    },
    {
        name = "Mixer",
        label = "Mixer",
        start_tier = 2,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-1, 0, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    {
        name = "Freezer",
        label = "Freezer",
        start_tier = 5,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local kinetic_input = Class.find("KineticInputAccessor")

            local a = crafter:create_accessor(kinetic_input)
            a:set_side_pos(Vec3i.left(), Vec3i.new(-1, 0, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput", "HeatOutput"}
    },
    {
        name = "AutomaticFarm",
        label = "Automatic Farm",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(-3, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(-3, -2, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(-3, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1),
            Vec3i.new(-3, -2, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(-3, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(-3, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(-3, -1, 2),
            Vec3i.new(0, -2, 2),
            Vec3i.new(-1, -2, 2),
            Vec3i.new(-2, -2, 2),
            Vec3i.new(-3, -2, 2)
        },
        start_tier = 1,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local fluid_input = Class.find("FluidInputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.input_container)
        end,
        description = {"FluidInput"}
    },
    {
        name = "AtmosphericCondenser",
        label = "Atmospheric Condenser",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1)
        },
        start_tier = 1,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local a = crafter:create_accessor(Class.find("FluidOutputAccessor"))
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(Class.find("KineticInputAccessor"))
            a:set_side_pos(Vec3i.right(), Vec3i.new(-1, -2, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput", "FluidOutput"}
    },
    {
        name = "Terminal",
        label = "Terminal",
        start_tier = 4,
        end_tier = 4,
        logic = "Monitor"
    },
    {
        name = "BigTerminal",
        label = "Big Terminal",
        start_tier = 5,
        end_tier = 5,
        image = "Terminal",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(0, -1, 1)
        },
        logic = "Monitor"
    },
    {
        name = "HugeTerminal",
        label = "Huge Terminal",
        start_tier = 6,
        end_tier = 6,
        image = "Terminal",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(0, -2, 2)
        },
        logic = "Monitor"
    },
    {
        name = "FlatTerminal",
        label = "Flat Terminal",
        start_tier = 4,
        end_tier = 4,
        logic = "Monitor"
    },
    {
        name = "BigFlatTerminal",
        label = "Big Flat Terminal",
        start_tier = 5,
        end_tier = 5,
        image = "FlatTerminal",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(0, -1, 1)
        },
        logic = "Monitor"
    },
    {
        name = "HugeFlatTerminal",
        label = "Huge Flat Terminal",
        start_tier = 6,
        end_tier = 6,
        image = "FlatTerminal",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(0, -2, 2)
        },
        logic = "Monitor"
    },
    {
        name = "Computer",
        label = "Computer",
        start_tier = 1,
        end_tier = 10,
        logic = "Computer",
        description = {"ElectricInput"}
    },
    {
        name = "QuantumComputer",
        label = "Quantum Computer",
        start_tier = 5,
        end_tier = 10,
        logic = "QuantumComputer",
        description = {"ElectricInput"},
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(0, -2, 2),
            Vec3i.new(-1, -2, 2),
            Vec3i.new(-2, -2, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2)
        }
    },
    {
        name = "IndustrialSeparator",
        label = "Industrial Separator",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1)
        },
        start_tier = 3,
        end_tier = 10,
        common_text_keys = {"Separator", "AutoCrafter"},
        logic = "AutoCrafter",
        block_creation = function(crafter)
            local a = crafter:create_accessor(Class.find("KineticInputAccessor"))
            a:set_side_pos(Vec3i.back(), Vec3i.new(-1, 1, 0))
            a:bind(crafter.input_container)
        end,
        description = {"KineticInput"}
    },
    {
        name = "Radiator",
        label = "Radiator",
        start_tier = 3,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local a = crafter:create_accessor(Class.find("HeatInputAccessor"))
            a:set_side_pos(Vec3i.down(), Vec3i.zero())
            a:bind(crafter.input_container)
        end,
        description = {"HeatInput"}
    },
    {
        name = "Diode",
        label = "Diode",
        logic = "Diode",
        start_tier = 2,
        end_tier = 10,
        description = {"ElectricInput", "ElectricOutput"}
    },
    -- ,{
    -- 	name = "Tank",
    -- 	label = "Tank",
    -- 	sub_blocks = {
    -- 		[0,0,0),[-1,0,0),[-2,0,0),
    -- 		[0,1,0),[-1,1,0),[-2,1,0),
    -- 		[0,-1,0),[-1,-1,0),[-2,-1,0),
    --
    -- 		[0,0,1),[-1,0,1),[-2,0,1),
    -- 		[0,1,1),[-1,1,1),[-2,1,1),
    -- 		[0,-1,1),[-1,-1,1),[-2,-1,1),
    --
    -- 		[0,0,2),[-1,0,2),[-2,0,2),
    -- 		[0,1,2),[-1,1,2),[-2,1,2),
    -- 		[0,-1,2),[-1,-1,2),[-2,-1,2),
    -- 	],
    -- 	start_tier = 1,
    -- 	end_tier = 10,
    -- 	common_text_keys =[
    -- 		"Container"
    -- 	],
    -- 	required_researches =["LiquidsScan"},
    -- },
    {
        name = "FissionReactor",
        label = "Fission Reactor",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(-3, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(-3, -2, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(-3, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1),
            Vec3i.new(-3, -2, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(-3, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(-3, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(-3, -1, 2),
            Vec3i.new(0, -2, 2),
            Vec3i.new(-1, -2, 2),
            Vec3i.new(-2, -2, 2),
            Vec3i.new(-3, -2, 2),
            Vec3i.new(0, 0, 3),
            Vec3i.new(-1, 0, 3),
            Vec3i.new(-2, 0, 3),
            Vec3i.new(-3, 0, 3),
            Vec3i.new(0, 1, 3),
            Vec3i.new(-1, 1, 3),
            Vec3i.new(-2, 1, 3),
            Vec3i.new(-3, 1, 3),
            Vec3i.new(0, -1, 3),
            Vec3i.new(-1, -1, 3),
            Vec3i.new(-2, -1, 3),
            Vec3i.new(-3, -1, 3),
            Vec3i.new(0, -2, 3),
            Vec3i.new(-1, -2, 3),
            Vec3i.new(-2, -2, 3),
            Vec3i.new(-3, -2, 3),
            Vec3i.new(0, 0, 4),
            Vec3i.new(-1, 0, 4),
            Vec3i.new(-2, 0, 4),
            Vec3i.new(-3, 0, 4),
            Vec3i.new(0, 1, 4),
            Vec3i.new(-1, 1, 4),
            Vec3i.new(-2, 1, 4),
            Vec3i.new(-3, 1, 4),
            Vec3i.new(0, -1, 4),
            Vec3i.new(-1, -1, 4),
            Vec3i.new(-2, -1, 4),
            Vec3i.new(-3, -1, 4),
            Vec3i.new(0, -2, 4),
            Vec3i.new(-1, -2, 4),
            Vec3i.new(-2, -2, 4),
            Vec3i.new(-3, -2, 4)
        },
        start_tier = 5,
        end_tier = 10,
        logic = "FissionReactor",
        block_creation = function(crafter)
            local heat_output = Class.find("HeatOutputAccessor")

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.left(), Vec3i.new(0, 1, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 1, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, -2, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.right(), Vec3i.new(0, -2, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.left(), Vec3i.new(-3, 1, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-3, 1, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-3, -2, 0))
            a:bind(crafter.output_container)

            local a = crafter:create_accessor(heat_output)
            a:set_side_pos(Vec3i.right(), Vec3i.new(-3, -2, 0))
            a:bind(crafter.output_container)
        end,
        custom_data = {
            load_independent = true,
            storage_force_capacity = 10000000,
            storage_drain = 80
        },
        description = {"HeatOutput"}
    },
    {
        name = "FusionReactor",
        label = "Fusion Reactor",
        start_tier = 6,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(-4, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(-3, 1, 0),
            Vec3i.new(-4, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(-4, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(-3, -2, 0),
            Vec3i.new(-4, -2, 0),
            Vec3i.new(0, -3, 0),
            Vec3i.new(-1, -3, 0),
            Vec3i.new(-2, -3, 0),
            Vec3i.new(-3, -3, 0),
            Vec3i.new(-4, -3, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(-4, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(-3, 1, 1),
            Vec3i.new(-4, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1),
            Vec3i.new(-4, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1),
            Vec3i.new(-3, -2, 1),
            Vec3i.new(-4, -2, 1),
            Vec3i.new(0, -3, 1),
            Vec3i.new(-1, -3, 1),
            Vec3i.new(-2, -3, 1),
            Vec3i.new(-3, -3, 1),
            Vec3i.new(-4, -3, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(-3, 0, 2),
            Vec3i.new(-4, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(-3, 1, 2),
            Vec3i.new(-4, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(-3, -1, 2),
            Vec3i.new(-4, -1, 2),
            Vec3i.new(0, -2, 2),
            Vec3i.new(-1, -2, 2),
            Vec3i.new(-2, -2, 2),
            Vec3i.new(-3, -2, 2),
            Vec3i.new(-4, -2, 2),
            Vec3i.new(0, -3, 2),
            Vec3i.new(-1, -3, 2),
            Vec3i.new(-2, -3, 2),
            Vec3i.new(-3, -3, 2),
            Vec3i.new(-4, -3, 2),
            Vec3i.new(0, 0, 3),
            Vec3i.new(-1, 0, 3),
            Vec3i.new(-2, 0, 3),
            Vec3i.new(-3, 0, 3),
            Vec3i.new(-4, 0, 3),
            Vec3i.new(0, 1, 3),
            Vec3i.new(-1, 1, 3),
            Vec3i.new(-2, 1, 3),
            Vec3i.new(-3, 1, 3),
            Vec3i.new(-4, 1, 3),
            Vec3i.new(0, -1, 3),
            Vec3i.new(-1, -1, 3),
            Vec3i.new(-2, -1, 3),
            Vec3i.new(-3, -1, 3),
            Vec3i.new(-4, -1, 3),
            Vec3i.new(0, -2, 3),
            Vec3i.new(-1, -2, 3),
            Vec3i.new(-2, -2, 3),
            Vec3i.new(-3, -2, 3),
            Vec3i.new(-4, -2, 3),
            Vec3i.new(0, -3, 3),
            Vec3i.new(-1, -3, 3),
            Vec3i.new(-2, -3, 3),
            Vec3i.new(-3, -3, 3),
            Vec3i.new(-4, -3, 3)
        },
        logic = "FusionReactor",
        block_creation = function(crafter)
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 1, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.left(), Vec3i.new(0, 1, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, -3, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.right(), Vec3i.new(0, -3, 0))
            a:bind(crafter.input_container)
        end
    },
    {
        name = "IndustrialBoiler",
        label = "Industrial Boiler",
        start_tier = 5,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(0, -2, 0),
            Vec3i.new(-1, -2, 0),
            Vec3i.new(-2, -2, 0),
            Vec3i.new(-3, -2, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1),
            Vec3i.new(0, -2, 1),
            Vec3i.new(-1, -2, 1),
            Vec3i.new(-2, -2, 1),
            Vec3i.new(-3, -2, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(-3, 0, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(-3, -1, 2),
            Vec3i.new(0, -2, 2),
            Vec3i.new(-1, -2, 2),
            Vec3i.new(-2, -2, 2),
            Vec3i.new(-3, -2, 2)
        },
        logic = "FissionReactor",
        block_creation = function(crafter)
            local heat_input = Class.find("HeatInputAccessor")
            local fluid_input = Class.find("FluidInputAccessor")
            local fluid_output = Class.find("FluidOutputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.front(), Vec3i.new(0, 0, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(0, -1, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(-1, -1, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(-2, -1, 0))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(-3, -1, 0))
            a:bind(crafter.input_container)

            a = crafter:create_accessor(fluid_output)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-3, 0, 0))
            a:bind(crafter.output_container)
        end,
        description = {"FluidInput", "FluidOutput", "PowerOutput"},
        power_output = fission_fullpower * 0.9,
        custom_data = {
            storage_force_capacity = 6000000,
            storage_drain = 0
        }
    },
    {
        name = "SolarPanel",
        label = "Solar Panel",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(1, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(1, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(1, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(1, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(1, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(1, -1, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(1, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(1, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(1, -1, 2)
        },
        start_tier = 3,
        end_tier = 10,
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local electric_output = Class.find("ElectricOutputAccessor")

            local a = crafter:create_accessor(electric_output)
            a:set_side_pos(Vec3i.down(), Vec3i.new(0, 0, 0))
            a:bind(crafter.output_container)
        end,
        description = {"ElectricOutput", "PowerOutput"},
        power_output = 50
    },
    {
        name = "Pumpjack",
        label = "Pumpjack",
        logic = "Pumpjack",
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(-3, 0, 0),
            Vec3i.new(-4, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(-3, 1, 0),
            Vec3i.new(-4, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-3, -1, 0),
            Vec3i.new(-4, -1, 0),
            Vec3i.new(0, 0, 1),
            Vec3i.new(-1, 0, 1),
            Vec3i.new(-2, 0, 1),
            Vec3i.new(-3, 0, 1),
            Vec3i.new(-4, 0, 1),
            Vec3i.new(0, 1, 1),
            Vec3i.new(-1, 1, 1),
            Vec3i.new(-2, 1, 1),
            Vec3i.new(-3, 1, 1),
            Vec3i.new(-4, 1, 1),
            Vec3i.new(0, -1, 1),
            Vec3i.new(-1, -1, 1),
            Vec3i.new(-2, -1, 1),
            Vec3i.new(-3, -1, 1),
            Vec3i.new(-4, -1, 1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(-3, 0, 2),
            Vec3i.new(-4, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(-3, 1, 2),
            Vec3i.new(-4, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2),
            Vec3i.new(-3, -1, 2),
            Vec3i.new(-4, -1, 2),
            Vec3i.new(0, 0, 3),
            Vec3i.new(-1, 0, 3),
            Vec3i.new(-2, 0, 3),
            Vec3i.new(-3, 0, 3),
            Vec3i.new(-4, 0, 3),
            Vec3i.new(0, 1, 3),
            Vec3i.new(-1, 1, 3),
            Vec3i.new(-2, 1, 3),
            Vec3i.new(-3, 1, 3),
            Vec3i.new(-4, 1, 3),
            Vec3i.new(0, -1, 3),
            Vec3i.new(-1, -1, 3),
            Vec3i.new(-2, -1, 3),
            Vec3i.new(-3, -1, 3),
            Vec3i.new(-4, -1, 3)
        },
        start_tier = 3,
        end_tier = 10,
        description = {"KineticInput", "FluidOutput"}
    },
    ----,{
    ----	name = "PneumaticPipe",
    ----	label = "Pneumatic Pipe",
    ----	start_tier = 3,
    ----	end_tier = 5,
    ----	common_text_keys =[
    ----
    ----	],
    ----
    ----}
    ----,{
    ----	name = "PneumaticInput",
    ----	label = "Pneumatic Input",
    ----	start_tier = 3,
    ----	end_tier = 5,
    ----	common_text_keys =[
    ----
    ----	],
    ----
    ----}
    -- {
    -- 	name = "DistributionBox",
    -- 	label = "Distribution Box",
    -- 	start_tier = 2,
    -- 	end_tier = 7,
    -- 	common_text_keys =[
    -- 		"Chest"
    -- 	],
    -- },
    -- {
    -- 	name = "HeatExchanger",
    -- 	label = "Heat Exchanger",
    -- 	start_tier = 3,
    -- 	end_tier = 10,
    -- 	block_logic =""SelectCrafter"",
    -- 	block_creation ="""
    -- 	local crafter = current_block_logic()
    --
    -- 	local a = crafter:create_accessor(FluidInputAccessor))
    -- 	a:set_side_pos(Vec3i.left(), Vec3i.zero())
    -- 	a:bind(crafter.input_container)
    --
    -- 	local a = crafter:create_accessor(FluidOutputAccessor))
    -- 	a:set_side_pos(Vec3i.right(), Vec3i.zero())
    -- 	a:bind(crafter.output_container)
    --
    -- 	local a = crafter:create_accessor(HeatOutputAccessor))
    -- 	a:set_side_pos(Vec3i.up(), Vec3i.zero())
    -- 	a:bind(crafter.output_container)
    -- 	end,
    -- 	required_researches =["HeatTransferring"},
    -- }
    -- ,{
    -- 	name = "InverseHeatExchanger",
    -- 	label = "Inverse Heat Exchanger",
    -- 	start_tier = 1,
    -- 	end_tier = 10,
    -- 	block_logic =""SelectCrafter"",
    -- 	block_creation ="""
    -- 	local crafter = current_block_logic()
    --
    -- 	local a = crafter:create_accessor(FluidInputAccessor))
    -- 	a:set_side_pos(Vec3i.left(), Vec3i.zero())
    -- 	a:bind(crafter.input_container)
    --
    -- 	local a = crafter:create_accessor(FluidOutputAccessor))
    -- 	a:set_side_pos(Vec3i.right(), Vec3i.zero())
    -- 	a:bind(crafter.output_container)
    --
    -- 	local a = crafter:create_accessor(HeatInputAccessor))
    -- 	a:set_side_pos(Vec3i.down(), Vec3i.zero())
    -- 	a:bind(crafter.input_container)
    -- 	end,
    -- 	required_researches =["HeatTransferring"},
    -- }
    -- ,{
    -- 	name = "IndustrialOven",
    -- 	label = "Industrial Oven",
    -- 	start_tier = 3,
    -- 	end_tier = 7,
    -- 	common_text_keys =[
    -- 		"Dryer",
    -- 		"CokeOven"
    -- 	],
    --
    -- 	sub_blocks = {
    -- 		[0,0,0),[-1,0,0),
    -- 		[0,1,0),[-1,1,0),
    -- 	],
    --
    -- }
    {
        name = "IndustrialSmelter",
        label = "Industrial Smelter",
        start_tier = 4,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-1, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(-2, -1, 0),
            Vec3i.new(-1, 0, 1),
            -- [0,0,1),[-2,0,1),
            -- [0,1,1),[-1,1,1),[-2,1,1),
            -- [-1,-1,1),[0,-1,1),[-2,-1,1),
            Vec3i.new(0, 0, 2),
            Vec3i.new(-1, 0, 2),
            Vec3i.new(-2, 0, 2),
            Vec3i.new(0, 1, 2),
            Vec3i.new(-1, 1, 2),
            Vec3i.new(-2, 1, 2),
            Vec3i.new(0, -1, 2),
            Vec3i.new(-1, -1, 2),
            Vec3i.new(-2, -1, 2)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local heat_input = Class.find("HeatInputAccessor")
            local fluid_input = Class.find("FluidInputAccessor")
            local fluid_output = Class.find("FluidOutputAccessor")

            local a = crafter:create_accessor(fluid_input)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-1, 0, 2))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(0, 0, 2))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(-2, 0, 2))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(-1, 1, 2))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_input)
            a:set_side_pos(Vec3i.down(), Vec3i.new(-1, -1, 2))
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(fluid_output)
            a:set_side_pos(Vec3i.back(), Vec3i.new(-2, 0, 0))
            a:bind(crafter.output_container)
        end,
        description = {"HeatInput"}
    },
    {
        name = "InductionCoil",
        label = "Induction Coil",
        start_tier = 4,
        end_tier = 10,
        sub_blocks = {
            Vec3i.new(0, 0, 0),
            Vec3i.new(-2, 0, 0),
            Vec3i.new(0, 1, 0),
            Vec3i.new(-1, 1, 0),
            Vec3i.new(-2, 1, 0),
            Vec3i.new(-1, -1, 0),
            Vec3i.new(0, -1, 0),
            Vec3i.new(-2, -1, 0)
        },
        logic = "SelectCrafter",
        block_creation = function(crafter)
            local heat_output = Class.find("HeatOutputAccessor")
            local electric_input = Class.find("ElectricInputAccessor")

            local a = crafter:create_accessor(electric_input)
            a:set_side_pos(Vec3i.front(), Vec3i.zero())
            a:bind(crafter.input_container)

            local a = crafter:create_accessor(heat_output)

            a:set_side_pos(Vec3i.up(), Vec3i.zero())
            a:bind(crafter.output_container)
        end,
        description = {"ElectricInput", "HeatOutput"}
    },
    -- {
    --     name = "CreativeController",
    --     label = "Creative Controller",
    --     logic = CreativeController,
    --     start_tier = 7,
    --     end_tier = 7,
    --     description = {"DataInput", "DataOutput"}
    -- },
    {
        name = "LogicCircuit",
        label = "Logic Circuit",
        logic = "LogicCircuit",
        start_tier = 2,
        end_tier = 2,
        description = {"DataInput", "DataOutput"}
    },
    {
        name = "LogicInterface",
        label = "Logic Interface",
        logic = "LogicInterface",
        start_tier = 2,
        end_tier = 2,
        description = {"DataOutput"}
    },
    {
        name = "LogicController",
        logic = "LogicController",
        label = "Logic Controller",
        start_tier = 2,
        end_tier = 2,
        description = {"DataInput"}
    },
    {
        name = "LogicDisplay",
        logic = "LogicDisplay",
        label = "Logic Display",
        start_tier = 2,
        end_tier = 2,
        description = {"DataInput"}
    },
    {
        name = "LogicWire",
        label = "Logic Wire",
        logic = "DataConductor",
        start_tier = 2,
        end_tier = 2,
        description = {"DataConductor"}
    }
    --,
    -- {
    --     name = "Button",
    --     label = "Button",
    --     logic = "Button",
    --     start_tier = 2,
    --     end_tier = 2,
    --     description = {"DataOutput"}
    -- },
    -- {
    --     name = "ToggleButton",
    --     logic = "ToggleButton",
    --     label = "Toggle Button",
    --     start_tier = 2,
    --     end_tier = 2,
    --     description = {"DataOutput"}
    -- }
}
