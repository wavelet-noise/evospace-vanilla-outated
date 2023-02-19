tier_material = {
    "Stone",
    "Copper",
    "Steel",
    "Aluminium",
    "StainlessSteel",
    "Titanium",
    "HardMetal",
    "Neutronium",
}

f_machine_bonus = 1.5

fission_fullpower = 7100 * 3.3 * 2 * 1.1 * 2

tiers_numlist = {0, 1, 2, 3, 4, 5, 6, 7}

int32max = 2147483647

function camel_to_spaces(name)
    return string.gsub(name, "([a-z])([A-Z])", "%1 %2")
end

recipes_constructor = {}
recipes_deconstructor = {}
recipes_hand = {}
objects_array = {}

function deepcopy(obj)
    if type(obj) ~= 'table' then return obj end
    local res = {}
    for k, v in pairs(obj) do res[deepcopy(k)] = deepcopy(v) end
    return res
end

function append_recipe(rd, recipe)
    local rec = Recipe.new()
    if recipe.name == nil then
        error("Recipe has no name")
    end
    rec.name = recipe.name
    print("Recipe "..recipe.name)
    for k, v in pairs(recipe) do
        -- fill inventories
        if k == "input" or k == "output" then
            for _, j in pairs(v) do
                local id = ItemData.new()
                id.item = Item.get(j.name)
                id.count = j.count
                rec[k]:add(id)
            end
        else
            -- fill resource slots
            if k == "res_input" or k == "res_output" then
                local id = ItemData.new()
                id.item = Item.get(v.name)
                id.count = math.floor(v.count)
                rec[k] = id
            else
                if k == "ticks" then
                    rec[k] = math.floor(v)
                else
                    -- other fields
                    if rec[k] then
                        rec[k] = v
                    end
                end
            end
        end
    end
    rd:add_recipe(rec)
end

function append_recipe_array(rd, array)
    local count = 0
    for _, i in pairs(array) do
        append_recipe(rd, i)
        count = count + 1
    end
    print(count.." recipes was added to "..rd.name)
end