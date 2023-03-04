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

            local mt = Item.get("CopperMultitool")
            local item_logic = BrushBreaker.get("CopperMultitool")
            mt.logic = item_logic
            item_logic.recipes = RecipeDictionary.get("Multitool")
            item_logic.tier = 2
        end,
        post_init = function () 
            
        end
    }
end