/// @description Insert description here
// You can write your code in this editor
switch screen {
	case menuScreen.TITLE:
	
		if(mainAnimFinished) {
			for(var i = 0; i < main_num_buttons; i++) {
				main_button_x[i] = width;
			}
			last_selected = 0;
			mainAnimFinished = false;
			switch(menu_index) {
				case 0: // play
					screen = menuScreen.CHAR_SEL;
				break;
				case 1: // options
					screen = menuScreen.OPTION;
				break;
				case 2: // quit
					game_end();
				break;
			}
			menu_index = 0;
			audio_play_sound(catchSound, 1, false);
		}
	break;
	case menuScreen.OPTION:
		switch(menu_index) {
			case 0: // background music volume
				if optionBackgroundSel 
					audio_group_set_gain(Background_Music, option_button_arg[0] / 100, 0);
				optionBackgroundSel = !optionBackgroundSel;
			break;
			case 1: // sound effect volume
				if optionSoundEffSel 
					audio_group_set_gain(Sound_Effects, option_button_arg[1] / 100, 0);
				optionSoundEffSel = !optionSoundEffSel;
			break;
			case 2: // apply and exit
				optionAnimFinished = false;
				var option_spread = ((height / 2 - y_gap * 2) / 3);
				for(var i = 0; i < option_num_buttons; i++) {
					option_button_x[i] = width / 2;
					option_button_y[i] = option_spread * (i + 1) - y_gap * 4;
				}
				last_selected = 0;
				menu_index = 0;
				screen = menuScreen.TITLE;
			break;
		}
		audio_play_sound(catchSound, 1, false);
	break;
	case menuScreen.CHAR_SEL:
		if !char_players_selected { // finished choosing num players
			char_players_selected = true;
			audio_play_sound(catchSound, 1, false);
		} else {
			var controller_pressed = false;
			for(var i = 0; i < char_button_arg[0]; i++) {
				if controller_pressed_enter[i] && !playerLockedIn[i] {					
					playerLockedIn[i] = true;
					audio_play_sound(catchSound, 1, false);
					controller_pressed = true;
				}
			}
			
			if !controller_pressed && num_controllers < char_button_arg[0] {
			
				if !playerLockedIn[num_controllers] {
					playerLockedIn[num_controllers] = true;
					audio_play_sound(catchSound, 1, false);
				}
				
			}
		}
	break;
	case menuScreen.LEVEL_SEL:
	break;
}