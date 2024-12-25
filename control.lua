local function contains(list, x)
	for _, v in ipairs(list) do
		if v == x then return true end
	end
	return false
end

local canTypes = {"canned-fish", "canned-salmon", "canned-cod", "canned-pufferfish", "canned-clownfish"}

script.on_event(defines.events.on_player_used_capsule,
function(event)
	if contains(canTypes, event.item.name) then
		player = game.get_player(event.player_index)
		player.get_main_inventory().insert({name="used-can", count=1})
	end
end)