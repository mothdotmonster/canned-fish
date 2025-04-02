local cannedPufferfish = table.deepcopy(data.raw["capsule"]["raw-pufferfish"])
local cannedPufferfishRecipe = makeCanningRecipe("canned-pufferfish", "raw-pufferfish", "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png", 160)

cannedPufferfish.name = "canned-pufferfish"
cannedPufferfish.spoil_ticks = spoilTime
cannedPufferfish.icons = makeCanIcon({1, 1, 0})
cannedPufferfish.subgroup = "canned-fish"

data:extend{cannedPufferfish, cannedPufferfishRecipe}

table.insert(canningTechEffects, { type = "unlock-recipe", recipe = "canned-pufferfish" })