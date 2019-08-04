/// @description Insert description here
// You can write your code in this editor

var key_left, key_right;
var key_space;

if index == -1 {
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_space = keyboard_check_pressed(vk_space);
	key_catch = keyboard_check_pressed(vk_tab);
} else {
	var haxis = gamepad_axis_value(index, gp_axislh);
	// var vaxis = gamepad_axis_value(index, gp_axislv);
	key_left = haxis < -0.3;
	key_right = haxis > 0.3;
	key_space = gamepad_button_check_pressed(index, gp_face1);
	key_catch = gamepad_button_check_pressed(index, gp_face2);
}

if impaled != undefined {
	x = impaled.x;
	y = impaled.y;

	vel = [0, 0];
} else {
	vel[1] += 0.7;
}

if !dead && can_catch && key_catch {
	can_catch = false;
	is_catching = true;
	alarm[0] = room_speed / 8;
	alarm[1] = room_speed / 2;
}

if key_left && key_right {
	key_left = false;
	key_right = false;
}

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
				vel[0] = 0
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
	grounded = false;
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
				vel[1] = 0;
				break;
			} else if found {
				break;
			} else {
				y += sign(vel[1]);
			}
		}
	} else {
		y += floor(vel[1]);
	}
}

var accel = grounded ? 0.5 : 0.3;
var max_speed = grounded ? 7 : 5;
var curr_friction = grounded ? 0.5 : 0.8;

if dead {
	
	sprite_index = sJump;
	image_speed = 0;
	image_index = 0;
	image_angle = 90;
	
} else if key_left { // walking left
	
	direction = -1;
	
	if vel[0] > -max_speed {
		vel[0] = max(vel[0] - accel, -max_speed);
	}
	
	if grounded {
		sprite_index = sWalk;
		image_speed = vel[0] / 3;
	} else {
		sprite_index = sJump;
		image_speed = 0;
		image_index = 1;
	}
	image_xscale = 1;
	
} else if key_right { // walking right
	
	direction = 1;
	
	if vel[0] < max_speed {
		vel[0] = min(vel[0] + accel, max_speed);
	}
	
	if grounded {
		sprite_index = sWalk;
		image_speed = vel[0] / 3;	
	} else {
		sprite_index = sJump;
		image_index = 1;
		image_speed = 0;
	}
	image_xscale = -1;
	
} else { // idle
	if grounded {
		sprite_index = sIdle;
		image_speed = 0.5;	
	} else {
		sprite_index = sJump;
		image_speed = 0;
		image_index = 1;
	}
}

if (!key_left && !key_right) || (key_left && vel[0] > 0) || (key_right && vel[0] < 0) {
	vel[0] *= curr_friction;
} else {
	if vel[0] < -max_speed {
		vel[0] = min(vel[0] * 0.99, -max_speed);
	} else if vel[0] > max_speed {
		vel[0] = max(vel[0] * 0.99, max_speed);
	}
}

if abs(vel[0]) < 0.3 {
	vel[0] = 0;
}

if abs(vel[1]) < 0.3 {
	vel[1] = 0;
}

if !dead && key_space && grounded { // jumping
	vel[1] = -15;
	sprite_index = sJump;
	image_speed = 0;
	
	if key_left {
		vel[0] = max(vel[0] - 4, -8.5);
	} else if key_right {
		vel[0] = min(vel[0] + 4, 8.5);
	}
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
