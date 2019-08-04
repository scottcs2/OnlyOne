/// @description Insert description here
// You can write your code in this editor

var count = 0;

for (var i = 0; i < 4; ++i) {
	var attached = gamepad_is_connected(i);
	if attached && players[i] == undefined {
		players[i] = instance_create_layer(room_width / 2, room_height / 2, "players", oPlayer);
		players[i].index = i;
	} else if !attached && players[i] != undefined {
		instance_destroy(players[i]);
		players[i] = undefined;
	}
	
	if attached {
		count++;
	}
}

if count == 0 {
	if keyboard == undefined {
		keyboard = instance_create_layer(room_width / 2, room_height / 2, "players", oPlayer);
		keyboard.index = -1;
	}
} else if keyboard != undefined {
	instance_destroy(keyboard);
	keyboard = undefined;
}
