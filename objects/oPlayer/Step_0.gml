/// @description Insert description here
// You can write your code in this editor

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_space = keyboard_check_pressed(vk_space);
key_catch = keyboard_check_pressed(vk_tab);

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

vel[1] += 0.7;

if (floor(vel[1]) != 0) {
	grounded = false;
	for (var y_move = 0; y_move < abs(floor(vel[1])); ++y_move) {
		var collide = place_meeting(x, y + (y_move + 1) * sign(vel[1]), oWall);
		if collide {
			grounded = vel[1] > 0;
			y += y_move * sign(vel[1]);
			vel[1] = 0;
			break;
		}
	}
	
	y += floor(vel[1]);
}

if (floor(vel[0]) != 0) {
	for (var x_move = 0; x_move < abs(floor(vel[0])); ++x_move) {
		var collide = place_meeting(x + (x_move + 1) * sign(vel[0]), y, oWall);
		if collide {
			x += x_move * sign(vel[0]);
			vel[0] = 0;
			break;
		}
	}
	
	x += floor(vel[0]);
}

var accel = grounded ? 0.5 : 0.3;
var max_speed = grounded ? 7 : 5;
var curr_friction = grounded ? 0.5 : 0.8;

if dead {
	sprite_index = sPlayerJump;
	image_speed = 0;
	image_index = 0;
	image_angle = 90;
} else if key_left { // walking left
	
	if vel[0] > -max_speed {
		vel[0] = max(vel[0] - accel, -max_speed);
	}
	
	if grounded {
		sprite_index = sPlayerWalk;
		image_speed = vel[0] / 3;
	} else {
		sprite_index = sPlayerJump;
		image_speed = 0;
		image_index = 1;
	}
	image_xscale = 1;
	
} else if key_right { // walking right
	
	if vel[0] < max_speed {
		vel[0] = min(vel[0] + accel, max_speed);
	}
	
	if grounded {
		sprite_index = sPlayerWalk;
		image_speed = vel[0] / 3;
	} else {
		sprite_index = sPlayerJump;
		image_index = 1;
		image_speed = 0;
	}
	image_xscale = -1;
	
} else { // idle
	if grounded {
		sprite_index = sPlayerIdle;
		image_speed = 0.5;	
	} else {
		sprite_index = sPlayerJump;
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
	sprite_index = sPlayerJump;
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
