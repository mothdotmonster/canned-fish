script.on_event(defines.events.on_player_used_capsule,
function(event)
	if event.item.name == "canned-fish" then
		player = game.get_player(event.player_index)
		player.get_main_inventory().insert({name="used-can", count=1})
	end
end)