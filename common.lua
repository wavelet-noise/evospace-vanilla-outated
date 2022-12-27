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

static_item = "Item"

int32max = 2147483647

quest = "StaticQuest"
qchapter = "StaticQuestChapter"

static_research = "StaticResearch"
static_chapter = "StaticChapter"
static_block = "Block"
static_surface = "Block"
static_decoration = "StaticDecoration"
static_prop = "SmallStaticProp"
static_big_prop = "BigStaticProp"

block_logic = "BlockLogic"
slot_logic = "item_logic"

building_cube_logic = "BuildingSurfaceBlockItemLogic"
building_single_logic = "BuildingSingleBlockItemLogic"
building_plane_logic = "BuildingPlaneBlockItemLogic"
building_cover_logic = "BuildingSingleBlockRotatedItemLogic"
building_decoration_logic = "BuildingDecorationItemLogic"
building_prop_logic = "BuildingPropItemLogic"

building_brush_slot_logic = "BuildingBrushItemLogic"
recipe_dictionary = "RecipeDictionary"
ico_generator = "IcoGenerator"

tesselator = "Tesselator"
tesselator_cube = "TesselatorCube"
tesselator_static_mesh = "TesselatorStaticMesh"

item_data = "ItemData"
prop_list = "PropList"

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

function append_recipe(recipe)
    local item_count = 0
    for _, item in pairs(recipe.Input.Items) do
        item_count = item_count + item.Count
    end

    local con_recipe = deepcopy(recipe)
    con_recipe.Ticks = math.max(math.min(item_count * 10, 1200), 20)
    con_recipe.ResourceInput = {name = "Electricity", Count = 20}
    table.insert(recipes_constructor, con_recipe)

    local dec_recipe = deepcopy(recipe)

    table.insert(recipes_hand, recipe)

    local output = deepcopy(dec_recipe.Input)

    dec_recipe.Input = deepcopy(dec_recipe.Output)
    dec_recipe.Ticks = math.max(math.min(item_count * 10, 1200), 20)
    dec_recipe.ResourceInput = {name = "Electricity", Count = 20}
    dec_recipe.Output = deepcopy(output)
    table.insert(recipes_deconstructor, dec_recipe)
end