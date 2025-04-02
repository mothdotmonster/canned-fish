-- utility functions and global variables
require("data/util.lua")
require("data/env.lua")

-- item definitions
require("data/item/empty-can.lua")
require("data/item/used-can.lua")
require("data/item/canned-fish.lua")
require("data/item/canned-bioflux.lua")

-- item subgroups
require("data/subgroup/canned-fish.lua")

-- compatibility with other mods
if mods["more-fish"] then
	require("data/compat/more-fish.lua")
end