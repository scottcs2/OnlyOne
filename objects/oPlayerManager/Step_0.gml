/// @description Insert description here
// You can write your code in this editor

if is_debug {
	var count = 0;

	for (var i = 0; i < 4; ++i) {
		var attached = gamepad_is_connected(i);
		if attached && players[i] == undefined {
			players[i] = instance_create_layer(room_width / 2, room_height / 2, "players", oPlayer);
			players[i].index = i;
		
			var spawn = instance_find(oPlayerSpawn, i);
			if spawn != noone {
				players[i].x = spawn.x;
				players[i].y = spawn.y;
			}
		
		} else if !attached && players[i] != undefined {
			instance_destroy(players[i]);
			players[i] = undefined;
		}
	
		if attached {
			count++;
		
			if players[i].dead {
				++dead;
			} else {
				++alive;
			}
		}
	}

	if count == 0 {
		if keyboard == undefined {
			keyboard = instance_create_layer(room_width / 2, room_height / 2, "players", oPlayer);
			keyboard.index = -1;
		
			var spawn = instance_find(oPlayerSpawn, 0);
			if spawn != noone {
				keyboard.x = spawn.x;
				keyboard.y = spawn.y;
			}
		}
	} else if keyboard != undefined {
		instance_destroy(keyboard);
		keyboard = undefined;
	}
}

var dead = 0;
var alive = 0;

for (var i = 0; i < 4; ++i) {
	if players[i] != undefined {
		if players[i].dead {
			++dead;
		} else {
			++alive;
		}
	}
}

show_debug_message("x")
show_debug_message(alive);
show_debug_message(dead);

if alive < 2 && dead > 0 {
	room_restart();
}
	