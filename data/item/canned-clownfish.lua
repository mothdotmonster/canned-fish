local cannedClownfish = table.deepcopy(data.raw["capsule"]["raw-clownfish"])
local cannedClownfishRecipe = makeCanningRecipe("canned-clownfish", "raw-clownfish", "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png", 160)

cannedClownfish.name = "canned-clownfish"
cannedClownfish.spoil_ticks = spoilTime
cannedClownfish.icons = makeCanIcon({.9, .5, .2})
cannedClownfish.subgroup = "canned-fish"

data:extend{cannedClownfish, cannedClownfishRecipe}

table.insert(canningTechEffects, { type = "unlock-recipe", recipe = "canned-clownfish" })