require("machines_gen")
require("materials_gen")
require("misc_gen")
require("recipes")

init = function() 
    return {
        pre_init = function() 
            
        end,
        init = function () 
            register_materials()
            register_recipes()
            register_misc()

            register_machines()
        end,
        post_init = function () 
            
        end
    }
end