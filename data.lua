local cannedFish = table.deepcopy(data.raw["capsule"]["raw-fish"])
local emptyCan = table.deepcopy(data.raw["item"]["barrel"])
local usedCan = table.deepcopy(data.raw["item"]["barrel"])

local spoilTime = 21600000

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

local function makeRecipe(name, fishType, iconPath, iconSize)
	recipe = {
		type = "recipe",
		name = name,
		enabled = false,
		energy_required = 1,
		ingredients = {
			{type = "item", name = fishType, amount = 1},
			{type = "item", name = "empty-can", amount = 1}
		},
		results = {{type = "item", name = name, amount = 1}},
		icons = {
			{
				icon = "__canned-fish__/icons/empty-can.png",
				icon_size = 64,
				scale = 0.3,
				shift = {3, 3}
			},
			{
				icon = iconPath,
				icon_size = iconSize,
				scale = ((32/iconSize)*0.6),
				shift = {-3, -3}
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
	enabled = false,
	energy_required = .2,
	ingredients = {
		{type = "item", name = "steel-plate", amount = 1}
	},
	results = {{type = "item", name = "empty-can", amount = 1}}
}

data:extend{emptyCan, emptyCanRecipe}

cannedFish.name = "canned-fish"
cannedFish.spoil_ticks = spoilTime
cannedFish.icons = colorCan({.6, .8, .2})

usedCan.name = "used-can"
usedCan.icon = "__canned-fish__/icons/open-can.png"

local usedCanRecipe = {
	type = "recipe",
	category = "recycling",
	name = "used-can-recycling",
	enabled = false,
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

local cannedFishRecipe = makeRecipe("canned-fish", "raw-fish", "__base__/graphics/icons/fish.png", 64)

data:extend{cannedFish, cannedFishRecipe}
data:extend{usedCan, usedCanRecipe}

effects = {
	{
		type = "unlock-recipe",
		recipe = "empty-can"
	},
	{
		type = "unlock-recipe",
		recipe = "canned-fish"
	}
}

if mods["more-fish"] then
	local cannedSalmon = table.deepcopy(data.raw["capsule"]["raw-salmon"])
	local cannedCod = table.deepcopy(data.raw["capsule"]["raw-cod"])
	local cannedPufferfish = table.deepcopy(data.raw["capsule"]["raw-pufferfish"])
	local cannedClownfish = table.deepcopy(data.raw["capsule"]["raw-clownfish"])

	cannedSalmon.name = "canned-salmon"
	cannedSalmon.spoil_ticks = spoilTime
	cannedSalmon.icons = colorCan({1, .5, .4})

	cannedCod.name = "canned-cod"
	cannedCod.spoil_ticks = spoilTime
	cannedCod.icons = colorCan({.8, .6, .6})

	cannedPufferfish.name = "canned-pufferfish"
	cannedPufferfish.spoil_ticks = spoilTime
	cannedPufferfish.icons = colorCan({1, 1, 0})

	cannedClownfish.name = "canned-clownfish"
	cannedClownfish.spoil_ticks = spoilTime
	cannedClownfish.icons = colorCan({.9, .5, .2})

	local cannedSalmonRecipe = makeRecipe("canned-salmon", "raw-salmon", "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png", 160)
	local cannedCodRecipe = makeRecipe("canned-cod", "raw-cod", "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png", 160)
	local cannedPufferfishRecipe = makeRecipe("canned-pufferfish", "raw-pufferfish", "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png", 160)
	local cannedClownfishRecipe = makeRecipe("canned-clownfish", "raw-clownfish", "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png", 160)

	data:extend{cannedSalmon, cannedSalmonRecipe}
	data:extend{cannedCod, cannedCodRecipe}
	data:extend{cannedPufferfish, cannedPufferfishRecipe}
	data:extend{cannedClownfish, cannedClownfishRecipe}

	table.insert(effects, { type = "unlock-recipe", recipe = "canned-salmon" })
	table.insert(effects, { type = "unlock-recipe", recipe = "canned-cod" })
	table.insert(effects, { type = "unlock-recipe", recipe = "canned-pufferfish" })
	table.insert(effects, { type = "unlock-recipe", recipe = "canned-clownfish" })
end

technology = {
	type = "technology",
	name = "canned-fish-tech",
	icon = "__canned-fish__/thumbnail.png",
	icon_size = 144,
	effects = effects,
	prerequisites = {"steel-processing"},
	unit =
	{
		count = 20,
		ingredients =
		{
			{"automation-science-pack", 1},
		},
		time = 10
	}
}

data:extend({technology})

table.insert(data.raw["technology"]["recycling"].effects, { type = "unlock-recipe", recipe = "used-can-recycling" })