/// @description Insert description here
// You can write your code in this editor

if holding != undefined {
	if holding.key_catch { // player is throwing
		
		if oPlayer.direction > 0 {
			vel[0] = 30;
		} else if oPlayer.direction < 0 {
			vel[0] = -30;
		} else {
			vel[0] = -30;
		}

		audio_play_sound(throwSound, 1, false);
		thrown = true;
		throwing = holding;
		holding = undefined;
	} else {
		x = holding.x;
		y = holding.y;
	}
} else if not grounded {
	if throwing != undefined && !place_meeting(x, y, throwing) {
		throwing = undefined;
	}

	for (var i = 0; i < ds_list_size(impaled); ++i) {
		var player = ds_list_find_value(impaled, i);
		player.x = x;
		player.y = y;
	}
	
	vel[1] -= 0.2;
	x = x + vel[0];
	y = y - vel[1];

	if x - abs(sprite_width) / 2 > room_width {
		x = -abs(sprite_width) / 2;
	} else if x + abs(sprite_width) / 2 < 0 {
		x = room_width + abs(sprite_width) / 2;
	}

	if y - abs(sprite_height) / 2 > room_height {
		y = -abs(sprite_height) / 2;
	} else if y + abs(sprite_height) / 2 < 0 {
		y = room_height + abs(sprite_height) / 2;
	}
}