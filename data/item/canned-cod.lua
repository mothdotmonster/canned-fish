local cannedCod = table.deepcopy(data.raw["capsule"]["raw-cod"])
local cannedCodRecipe = makeCanningRecipe("canned-cod", "raw-cod", "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png", 160)

cannedCod.name = "canned-cod"
cannedCod.spoil_ticks = spoilTime
cannedCod.icons = makeCanIcon({.8, .6, .6})
cannedCod.subgroup = "canned-fish"

data:extend{cannedCod, cannedCodRecipe}

table.insert(canningTechEffects, { type = "unlock-recipe", recipe = "canned-cod" })