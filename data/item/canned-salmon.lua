local cannedSalmon = table.deepcopy(data.raw["capsule"]["raw-salmon"])
local cannedSalmonRecipe = makeCanningRecipe("canned-salmon", "raw-salmon", "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png", 160)

cannedSalmon.name = "canned-salmon"
cannedSalmon.spoil_ticks = spoilTime
cannedSalmon.icons = makeCanIcon({1, .5, .4})
cannedSalmon.subgroup = "canned-fish"

data:extend{cannedSalmon, cannedSalmonRecipe}

table.insert(canningTechEffects, { type = "unlock-recipe", recipe = "canned-salmon" })