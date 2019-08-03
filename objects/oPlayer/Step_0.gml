/// @description Insert description here
// You can write your code in this editor

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_space = keyboard_check(vk_space);

vel[1] += 0.8;
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

for (var x_move = 0; x_move < abs(floor(vel[0])); ++x_move) {
	var collide = place_meeting(x + (x_move + 1) * sign(vel[0]), y, oWall);
	if collide {
		x += x_move * sign(vel[0]);
		vel[0] = 0;
		break;
	}
}
		
x += floor(vel[0]);
y += floor(vel[1]);

if key_left {
	vel[0] -= .1;
} else if key_right {
	vel[0] += .1;
}

vel[0] *= 0.99;

if key_space && grounded {
	vel[1] = -10;
}

if x > room_width {
	x = 0 - sprite_width;
} else if x + sprite_width < 0 {
	x = room_width;
}

if y > room_height {
	y = 0 - sprite_height;
} else if y + sprite_height < 0 {
	y = room_height ;
}
