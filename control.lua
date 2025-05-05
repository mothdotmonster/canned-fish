-- helper function for comparing list contents
function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

-- used can spawning logic
local canTypes = {"canned-fish", "canned-salmon", "canned-cod", "canned-pufferfish", "canned-clownfish", "canned-bioflux"}

script.on_event(defines.events.on_player_used_capsule,
function(event)
	if contains(canTypes, event.item.name) then
		player = game.get_player(event.player_index)
		player.get_main_inventory().insert({name="used-can", count=1})
		if (event.quality.next == nil) then
			player.unlock_achievement("blue-ribbon-of-the-sea")
		end
	end
end)

-- easter egg (biters don't like canned food)
local spawnerOpen = false
local spawner = nil
local playerID = nil

-- Hooking into GUI events makes this much faster, as there are only a handful of players at any one time,
-- while even a moderate save will have thousands of assembling machines to check one by one.
-- It also makes the easter egg much funnier.
-- The logic for this may sometimes break in multiplayer if two players try to trigger it at the same time.
-- I don't care enough to fix that.

script.on_event(defines.events.on_gui_opened,
function(event)
	if (event.entity ~= nil and event.entity.name == "captive-biter-spawner") then
		spawnerOpen = true
		spawner = event.entity
		playerID = event.player_index
	end
end)

script.on_event(defines.events.on_gui_closed,
function(event)
	if (event.entity ~= nil and event.entity.name == "captive-biter-spawner") then
		spawnerOpen = false
		spawner = nil
		playerID = nil
	end
end)

script.on_event(defines.events.on_player_cursor_stack_changed,
function(event)
	if (event.player_index == playerID and spawnerOpen) then
		player = game.get_player(playerID)
		if (player.cursor_stack.valid_for_read and player.cursor_stack.name == "canned-bioflux" and spawner ~= nil) then
			spawner.die()
			player.unlock_achievement("sorry-charlie")
		end
	end
end)