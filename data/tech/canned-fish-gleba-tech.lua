local glebaTech = {
	type = "technology",
	name = "canned-fish-gleba-tech",
	icons = makeRecipeIcon("__space-age__/graphics/technology/bioflux.png", 256),
	effects = {
		{
			type = "unlock-recipe",
			recipe = "canned-bioflux"
		},
	},
	prerequisites = {"agricultural-science-pack"},
	unit =
	{
		count = 250,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"space-science-pack", 1},
			{"agricultural-science-pack", 1},
		},
		time = 20
	}
}

data:extend({glebaTech})