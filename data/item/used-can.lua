local usedCan = table.deepcopy(data.raw["item"]["barrel"])
local usedCanRecipe = {
	type = "recipe",
	category = "recycling",
	name = "used-can-recycling",
	enabled = false,
	energy_required = 1,
	ingredients = {{
		type = "item",
		name = "used-can",
		amount = 1
	}},
	results = {{
		type = "item",
		name = "steel-plate",
		amount = 1,
		probability = .25
	}},
	hide_from_player_crafting = true,
	hidden_in_factoriopedia = true,
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

usedCan.name = "used-can"
usedCan.icon = "__canned-fish__/icons/open-can.png"
usedCan.subgroup = "canned-fish"

data:extend{usedCan, usedCanRecipe}