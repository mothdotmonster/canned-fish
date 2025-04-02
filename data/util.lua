function makeCanIcon(tint)
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

function makeRecipeIcon(iconPath, iconSize) -- this is broken out into its own function because i also use it to generate a tech icon
	icons = {
		{
			icon = "__canned-fish__/icons/empty-can.png",
			icon_size = 256,
			scale = 0.075,
			shift = {3, 3}
		},
		{
			icon = iconPath,
			icon_size = iconSize,
			scale = ((32/iconSize)*0.6),
			shift = {-3, -3}
		}
	}
	return icons
end

function makeCanningRecipe(name, fishType, iconPath, iconSize)
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
		icons = makeRecipeIcon(iconPath, iconSize)
	}
	return recipe
end