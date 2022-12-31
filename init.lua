require("machines_gen")
require("materials_gen")
require("misc_gen")
require("recipes")

function on_mod_pre_init()
end 

function on_mod_init()
    register_materials()
    register_recipes()
    register_misc()

    register_machines()
end

function on_mod_post_init()
end