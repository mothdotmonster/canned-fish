local cannedFish = table.deepcopy(data.raw["capsule"]["raw-fish"])
local emptyCan = table.deepcopy(data.raw["item"]["barrel"])
local usedCan = table.deepcopy(data.raw["item"]["barrel"])

local function colorCan(tint)
	icons = {
		{
			icon = "__canned-fish__/icons/blank-can.png",
			icon_size = 64
		},
		{
			icon = "__canned-fish__/icons/can-label.png",
			icon_size = 64,
			tint = tint
		},
		{
			icon = "__canned-fish__/icons/can-logo.png",
			icon_size = 64,
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
				icon = "__canned-fish__/icons/empty-can.png",
				icon_size = 64
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
emptyCan.icon = "__canned-fish__/icons/empty-can.png"

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

usedCan.name = "used-can"
usedCan.icon = "__canned-fish__/icons/open-can.png"

local usedCanRecipe = {
  type = "recipe",
	category = "recycling",
  name = "used-can-recycling",
  enabled = true,
  energy_required = 1,
  ingredients = {
    {type = "item", name = "used-can", amount = 1}
  },
  results = {{type = "item", name = "steel-plate", amount = 1}},
	hide_from_player_crafting = true,
	icons = {
		{
			icon = "__quality__/graphics/icons/recycling.png",
			icon_size = 64
		},
		{
			icon = "__canned-fish__/icons/open-can.png",
			icon_size = 64,
			scale = .3
		},
		{
			icon = "__quality__/graphics/icons/recycling-top.png",
			icon_size = 64
		}
	}
}

local cannedFishRecipe = makeRecipe("canned-fish", "__base__/graphics/icons/fish.png", 64)

data:extend{cannedFish, cannedFishRecipe}
data:extend{usedCan, usedCanRecipe}