local cannedBioflux = table.deepcopy(data.raw["capsule"]["bioflux"])
local cannedBiofluxRecipe = makeCanningRecipe("canned-bioflux", "bioflux", "__space-age__/graphics/icons/bioflux.png", 64)

cannedBioflux.name = "canned-bioflux"
cannedBioflux.spoil_ticks = spoilTime
cannedBioflux.icons = makeCanIcon({.6, .2, .1})
cannedBioflux.subgroup = "canned-fish"

-- reset these to prevent player from feeding canned food to biters
cannedBioflux.fuel_value = "0J"
cannedBioflux.fuel_category = ""

data:extend{cannedBioflux, cannedBiofluxRecipe}