require("machines_gen")
require("misc_item_logic")

init = function() 
    return {
        pre_init = function() 
            
        end,
        init = function () 
            register_machines()

            register_misc_items()

            local mt = Item.get("CopperMultitool")
            local item_logic = SphereBreaker.get("CopperMultitool")
            mt.logic, item_logic.item = item_logic, mt
            item_logic.recipes = RecipeDictionary.get("Multitool")
            item_logic.tier = 2
        end,
        post_init = function () 
            
        end
    }
end