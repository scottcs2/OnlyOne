/// @description Insert description here
// You can write your code in this editor


if !animFinished {
	for(var i = 0; i < num_buttons; i++) {
		button_x[i] -= slide_speed;
	}
	if button_x[0] <= final_x
		animFinished = true;
}

else {

	menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

	menu_index += menu_move;

	if (menu_index < 0) menu_index = num_buttons - 1;
	if (menu_index > num_buttons - 1) menu_index = 0;


	if (menu_index != last_selected) audio_play_sound(catchSound, 1, false);

	last_selected = menu_index;
}