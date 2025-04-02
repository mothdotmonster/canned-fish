local emptyCan = table.deepcopy(data.raw["item"]["barrel"])
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

emptyCan.name = "empty-can"
emptyCan.icon = "__canned-fish__/icons/empty-can.png"
emptyCan.icon_size = 256
emptyCan.subgroup = "canned-fish"

data:extend{emptyCan, emptyCanRecipe}