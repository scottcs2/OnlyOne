/// @description Insert description here
// You can write your code in this editor
key_space = keyboard_check(vk_tab);

vel[1] -= 0.1;

if thrown == false {
	if key_space {
		thrown = true;
	}	
	x = oPlayer.x;
	y = oPlayer.y;
} else {
	y = y - vel[1];
	x = x + vel[0];
}

repeat (floor(vel[1])) {
	var pix = vel[1] < 0 ? y - 1 : y + sprite_height;
	
	for (var i = 0; i < instance_number(oWall); ++i) {
		if collision_point(x, pix, instance_find(oWall, i), false, true) {
			grounded = true;
			break;
		}
	}
	
	if grounded {
		vel[1] = 0;
		break;
	} else {
		y += sign(vel[1]);	
	}
}

if x > room_width {
	x -= room_width + sprite_width;	
} else if x + sprite_width < 0 {
	x += room_width + sprite_width;
}

if y > room_height {
	y -= room_height + sprite_height;
} else if y + sprite_height < 0 {
	y += room_height + sprite_height;
}