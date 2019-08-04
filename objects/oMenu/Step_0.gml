/// @description Insert description here
// You can write your code in this editor

switch screen {
	case menuScreen.TITLE:
		if !mainAnimFinished {
			for(var i = 0; i < main_num_buttons; i++) {
				main_button_x[i] -= slide_speed;
			}
			if main_button_x[0] <= main_final_x
				mainAnimFinished = true;
		} else {

			menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

			menu_index += menu_move;

			if (menu_index < 0) 
				menu_index = main_num_buttons - 1;
			if (menu_index > main_num_buttons - 1) 
				menu_index = 0;

			if (menu_index != last_selected) 
				audio_play_sound(catchSound, 1, false);

			last_selected = menu_index;
		}
		break;
	case menuScreen.OPTION:
		if(!optionAnimFinished) {
			for(var i = 0; i < option_num_buttons; i++) {
				option_button_y[i] += slide_speed * 2.5;	
			}
			if option_button_y[1] >= (height / 3) {
				optionAnimFinished = true;	
			}
		}
		
		if(!optionBackgroundSel && !optionSoundEffSel) {
			menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
			menu_index += menu_move;
			
			if (menu_index < 0) 
				menu_index = option_num_buttons - 1;
			if (menu_index > option_num_buttons - 1) 
				menu_index = 0;
		}
		
		var adj = keyboard_check(vk_right) - keyboard_check(vk_left);
		
		if volumeSwitch && adj != 0 {
			volumeSwitch = false;
			alarm_set(0, room_speed / 5);

			if optionBackgroundSel 
				option_button_arg[0] += adj;
			else if optionSoundEffSel
				option_button_arg[1] += adj;
			
			option_button_arg[0] = max(0, option_button_arg[0]);
			option_button_arg[1] = max(0, option_button_arg[1]);
			option_button_arg[0] = min(100, option_button_arg[0]);
			option_button_arg[1] = min(100, option_button_arg[1]);
		}
		
		if (menu_index != last_selected) 
			audio_play_sound(catchSound, 1, false);

		last_selected = menu_index;

	break;
	case menuScreen.CHAR_SEL:
		if char_players_selected { // has selected num players
			
			
				
		} else { // still selecting num of players
			
			var adj = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);			
			char_button_arg[0] += adj;
			char_button_arg[0] = max(2, char_button_arg[0]);
			char_button_arg[0] = min(4, char_button_arg[0]);

		}
	
		break;
	case menuScreen.LEVEL_SEL:
		break;
}		