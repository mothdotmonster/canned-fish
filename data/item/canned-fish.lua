local cannedFish = table.deepcopy(data.raw["capsule"]["raw-fish"])
local cannedFishRecipe = makeCanningRecipe("canned-fish", "raw-fish", "__base__/graphics/icons/fish.png", 64)

cannedFish.name = "canned-fish"
cannedFish.spoil_ticks = spoilTime
cannedFish.icons = makeCanIcon({.6, .8, .2})
cannedFish.subgroup = "canned-fish"

data:extend{cannedFish, cannedFishRecipe}