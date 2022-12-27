require("machines_gen")
require("materials_gen")
require("misc_gen")

function on_mod_pre_init()
end 

function on_mod_init()
    register_machines()
    register_materials()
    register_misc()

    local tiers = {"Stone", "Copper", "Steel", "Aluminium", "StainlessSteel", "Titanium", "HardMetal", "Neutronium"}

    for _, tier in ipairs(tiers) do
        local bl = BlockLogic.find(tier.."Furnace")
        if bl then
            local crafter = CrafterBase.cast(bl)
            crafter.load_independent = true
            print(bl.name.." is now load independent")
        else
            error(tier.."Furnace".." is missing!")
        end
    end
end

function on_mod_post_init()
end