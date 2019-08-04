/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < 4; i++) {
	
	key_left[i] = 0;
	key_right[i] = 0;
	key_down[i] = 0;
	key_up[i] = 0;
	
	if gamepad_is_connected(i) {
		
		if gamepad_button_check_pressed(i, gp_face1) {
			controller_pressed_enter[i] = true;
			event_perform(ev_keypress, vk_enter);
		} else {
			controller_pressed_enter[i] = false;	
		}
		
		if controller_can_press[i] {
			var haxis = gamepad_axis_value(i, gp_axislh);
			var vaxis = gamepad_axis_value(i, gp_axislv);
		
			key_left[i] = haxis < -0.3;
			key_right[i] = haxis > 0.3;
			key_down[i] = vaxis > 0.3;
			key_up[i] = vaxis < -0.3;
			
			if (key_left[i] || key_right[i] || key_up[i] || key_down[i]) {
				controller_can_press[i] = false;
				alarm_set(i+1, room_speed / 4);
			}
		} 
		
	} else {
		
		if controller_can_press[i] {
			key_left[i] = keyboard_check(vk_left);
			key_right[i] = keyboard_check(vk_right);
			key_up[i] = keyboard_check(vk_up);
			key_down[i] = keyboard_check(vk_down);
			if key_left[i] || key_right[i] || key_up[i] || key_down[i] {
				controller_can_press[i] = false;
				alarm_set(i+1, room_speed / 4);
			}
			
		}
	}
}


switch screen {
	case menuScreen.TITLE:
		if !mainAnimFinished {
			for(var i = 0; i < main_num_buttons; i++) {
				main_button_x[i] -= slide_speed;
			}
			if main_button_x[0] <= main_final_x
				mainAnimFinished = true;
		} else {

			menu_move = key_down[0] - key_up[0];

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
			menu_move = key_down[0] - key_up[0];
			menu_index += menu_move;
			
			if (menu_index < 0) 
				menu_index = option_num_buttons - 1;
			if (menu_index > option_num_buttons - 1) 
				menu_index = 0;
		}
		
		var adj = key_right[0] - key_left[0];

		if optionBackgroundSel 
			option_button_arg[0] += adj;
		else if optionSoundEffSel
			option_button_arg[1] += adj;
			
		option_button_arg[0] = max(0, option_button_arg[0]);
		option_button_arg[1] = max(0, option_button_arg[1]);
		option_button_arg[0] = min(100, option_button_arg[0]);
		option_button_arg[1] = min(100, option_button_arg[1]);
		
		if (menu_index != last_selected) 
			audio_play_sound(catchSound, 1, false);

		last_selected = menu_index;

	break;
	case menuScreen.CHAR_SEL:
		if char_players_selected { // has selected num players
				
			var finished = true;	
			for(var i = 0; i < char_button_arg[0]; i++) {
				if !playerLockedIn[i] {
					finished = false;
				}
			}
			
			if finished {
				audio_stop_sound(menuMusic);
				inGame = true;
				audio_stop_all();
				audio_play_sound(inGameMusic,1, true);
				room_goto(room0);
				
				global.players = [-2, -2, -2, -2];
				global.player_selections = [0, 0, 0, 0];
				
				for(var i = 0; i < char_button_arg[0]; i++) {
					if playerLockedIn[i] {
						var index;
						if gamepad_is_connected(i) {
							index = i;
						} else {
							index = -1
						}
						
						global.players[i] = index;
						global.player_selections[i] = playerSel[i];
						show_debug_message(playerSel[i]);
					}
				}
			}
				
			for(var i = 0; i < 4; i++) {
			
				var adj = key_right[i] - key_left[i];
				
				if !playerLockedIn[i] {
					playerSel[i] = (playerSel[i] + adj) % 4;
					if playerSel[i] < 0 { playerSel[i] = 3; }
				}
			
			}
			
		} else { // still selecting num of players
			
			var adj = key_right[0] - key_left[0];			
			char_button_arg[0] += adj;
			char_button_arg[0] = max(2, char_button_arg[0]);
			char_button_arg[0] = min(num_controllers+1, char_button_arg[0]);

		}
	
		break;
	case menuScreen.LEVEL_SEL:
		break;
}		

if audio_group_is_loaded(Background_Music)  && !inGame {

	if !audio_is_playing(menuMusic) {
		audio_play_sound(menuMusic, 1, true);	
	}
	
}