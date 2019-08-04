/// @description Insert description here
// You can write your code in this editor

switch screen {
	case menuScreen.TITLE:
		draw_set_font(font_main);
		draw_set_halign(fa_left);
		//draw_set_valign(fa_top);
		draw_set_color(c_ltgray);
		draw_set_valign(fa_middle);

		spearIdx = spearIdx >= sprite_get_number(sSpear) ? 0 : spearIdx + 0.1;

		for(var i = 0; i < main_num_buttons; i++) {
			draw_set_color(c_ltgray);
			if (menu_index == i && mainAnimFinished) {
				draw_set_color(c_red);
				draw_sprite(sSpear, spearIdx, main_button_x[i] - 40, main_button_y[i]);
			}
			draw_text(main_button_x[i], main_button_y[i], main_button_t[i]);
		}
		break;
	case menuScreen.OPTION:
		draw_set_font(font_main);
		draw_set_halign(fa_right);
		draw_set_color(c_ltgray);
		draw_set_valign(fa_middle);
		
		spearIdx = spearIdx >= sprite_get_number(oSpear) ? 0 : spearIdx + 0.1;
		
		for(var i = 0; i < option_num_buttons; i++) {
			draw_set_color(c_ltgray);
			if (menu_index == i && optionAnimFinished) {
				draw_set_color(c_red);
				draw_set_halign(fa_left);
				draw_sprite(sSpear, spearIdx, option_button_x[i] - 330, option_button_y[i]);
				draw_set_halign(fa_right);
			}
			
			draw_text(option_button_x[i], option_button_y[i], option_button_t[i]);
			draw_text(option_button_x[i] + x_gap, option_button_y[i], string(option_button_arg[i]));

		}

		break;
	case menuScreen.CHAR_SEL:
		draw_set_font(font_main);
		draw_set_halign(fa_right);
		draw_set_color(c_ltgray);
		draw_set_valign(fa_middle);
		
		if !char_players_selected { // hasnt selected number of players yet
			draw_set_color(c_red);
			draw_text(char_button_x[0], char_button_y[0], char_button_t[0]);
			draw_text(char_button_x[0] + x_gap, char_button_y[0], string(char_button_arg[0]));
			
		} else { // finished selecting player number
			
			draw_text(char_button_x[0], char_button_y[0], char_button_t[0]);
			draw_set_halign(fa_center);
			
			for(var i = 1; i < char_num_buttons - (4 - char_button_arg[0]); i++)
				draw_text(char_button_x[i], char_button_y[i], char_button_t[i]);
				
			draw_text(char_button_x[0] + x_gap, char_button_y[0], string(char_button_arg[0]));
	
			for(var i = 0; i < char_button_arg[0]; i++) {
				if draw_portrait || playerLockedIn[i] {
					draw_sprite(characterPortrait[playerSel[i]], 0, char_portrait_x[i], char_portrait_y[i]);
				}
			}
			
			if alarm_get(5) <= 0 {
				if draw_portrait
					alarm_set(5, room_speed / 2);
				else
					alarm_set(5, room_speed / 4);
			}

		}
		
	break;
	case menuScreen.LEVEL_SEL:
		break;

}
