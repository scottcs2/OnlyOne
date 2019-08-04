/// @description Insert description here
// You can write your code in this editor

if holding != undefined && !instance_exists(holding) {
	holding = noone;
}

if holding == noone {
	visible = false;
	holding = instance_find(oPlayer, 0);
	exit;
} else {
	visible = true;
}	

if holding != undefined {
	if holding.key_catch { // player is throwing
		if holding.direction > 0 {
			vel[0] = 30;
		} else if holding.direction < 0 {
			vel[0] = -30;
		} else {
			vel[0] = -30;
		}

		audio_play_sound(throwSound, 1, false);
		vel[1] = -5;
		thrown = true;
		grounded = false;
		throwing = holding;
		holding = undefined;
	} else {
		if holding.direction > 0 {
			image_xscale = 1;
		} else {
			image_xscale = -1;
		}
		x = holding.x;
		y = holding.y;
	}
} else if not grounded {
	if throwing != undefined && !place_meeting(x, y, throwing) {
		throwing = undefined;
	}
	
	vel[1] += 0.3;

	if (floor(vel[0]) != 0) {
		if place_meeting(x + floor(vel[0]), y, oWall) {
			while (true) {
				var found = false;
				var collide = false;
				for (var i = 0; i < instance_number(oWall); ++i) {
					if place_meeting(x + sign(vel[0]), y, instance_find(oWall, i)) {
						if sign(vel[0]) == sign(instance_find(oWall, i).x - x) {
							collide = true;
						} else {
							found = true;
						}
						break;
					}
				}
			
				if collide {
					x += sign(vel[0]) * 6;
					grounded = true;
					break;
				} else if found {
					break;
				} else {
					x += sign(vel[0]);
				}
			}
		} else {
			x += floor(vel[0]);
		}
	}

	if (floor(vel[1]) != 0) {
		if place_meeting(x, y + floor(vel[1]), oWall) {
			while (true) {
				var found = false;
				var collide = false;
				for (var i = 0; i < instance_number(oWall); ++i) {
					if place_meeting(x, y + sign(vel[1]), instance_find(oWall, i)) {
						if sign(vel[1]) == sign(instance_find(oWall, i).y - y) {
							collide = true;
						} else {
							found = true;
						}
						break;
					}
				}
			
				if collide {
					grounded = true;
					break;
				} else if found {;
					break;
				} else {
					y += sign(vel[1]);
				}
			}
		} else {
			y += floor(vel[1]);
		}
	}

	if grounded {
		vel[0] = 0;
		vel[1] = 0;
		grounded = true;
	}

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