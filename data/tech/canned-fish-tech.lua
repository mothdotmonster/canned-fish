canningTech = {
	type = "technology",
	name = "canned-fish-tech",
	icon = "__canned-fish__/thumbnail.png",
	icon_size = 144,
	effects = canningTechEffects,
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

data:extend({canningTech})