/// @description Insert description here
// You can write your code in this editor
//key_tab = keyboard_check(vk_tab);

//if thrown == false {
//	if key_tab {
//		thrown = true;
//	}	
//	x = oPlayer.x;
//	y = oPlayer.y;
//} else if not grounded{
//	vel[1] -= 0.15;
//	y = y - vel[1];
//	x = x + vel[0];
//}

key_tab_press = keyboard_check_pressed(vk_tab);
key_tab_release = keyboard_check_released(vk_tab);

if thrown == false {
	if key_tab_release {
		if oPlayer.key_left {
			vel[0] = -15;
		} else if oPlayer.key_right {
			vel[0] = 15;
		}
		thrown = true;
	}
	x = oPlayer.x;
	y = oPlayer.y;
} else if not grounded {
	vel[1] -= 0.15;
	y = y - vel[1];
	x = x + vel[0];
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