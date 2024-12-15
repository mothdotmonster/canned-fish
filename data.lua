local cannedFish = table.deepcopy(data.raw["capsule"]["raw-fish"])
local emptyCan = table.deepcopy(data.raw["item"]["barrel"])

local function colorCan(tint)
	icons = {
		{
			icon = "__canned-fish__/icons/organic-food-canned-3.png",
			icon_size = 64
		},
		{
			icon = "__canned-fish__/icons/can-label.png",
			icon_size = 64,
			tint = tint
		}
	}
	return icons
end

local function makeRecipe(name, iconPath, iconSize)
	recipe = {
		type = "recipe",
		name = name,
		enabled = true,
		energy_required = 1,
		ingredients = {
			{type = "item", name = "raw-fish", amount = 1},
			{type = "item", name = "empty-can", amount = 1}
		},
		results = {{type = "item", name = name, amount = 1}},
		icons = {
			{
				icon = "__canned-fish__/icons/organic-food-canned-3.png",
				icon_size = 64
			},
			{
				icon = "__canned-fish__/icons/can-label.png",
				icon_size = 64,
				tint = {.5, .5, .5}
			},
			{
				icon = iconPath,
				icon_size = iconSize,
				shift = {-8, -8}
			}
		}
	}
	return recipe
end

emptyCan.name = "empty-can"
emptyCan.icons = colorCan({.5, .5, .5})

local emptyCanRecipe = {
  type = "recipe",
  name = "empty-can",
  enabled = true,
  energy_required = .2,
  ingredients = {
    {type = "item", name = "steel-plate", amount = 1}
  },
  results = {{type = "item", name = "empty-can", amount = 1}}
}
data:extend{emptyCan, emptyCanRecipe}

cannedFish.name = "canned-fish"
cannedFish.spoil_ticks = 21600000
cannedFish.icons = colorCan({.6, .8, .2})

local cannedFishRecipe = makeRecipe("canned-fish", "__base__/graphics/icons/fish.png", 64)
data:extend{cannedFish, cannedFishRecipe}