/// @description Insert description here
// You can write your code in this editor

height = display_get_gui_height()
width = display_get_gui_width();

y_gap = 50;
x_gap = 100;
menu_index = 0;
last_selected = 0;

for(var i = 0; i < 4; i++) {
	controller_can_press[i] = true;
	controller_pressed_enter[i] = false;
	playerSel[i] = 0;
	playerLockedIn[i] = false;
}

num_controllers = 4;

for(var i = 0; i < 4; i++) {
	if gamepad_is_connected(i)
		continue;
	else {
		num_controllers = i;
		break;
	}
}


characterPortrait[0] = sSpectrePortrait;
characterPortrait[1] = sSkelePortrait;
characterPortrait[2] = sSnakePortrait;
characterPortrait[3] = sCatPortrait;

enum menuScreen {
	TITLE = 0,
	OPTION = 1,
	CHAR_SEL = 2,
	LEVEL_SEL = 3
}

screen = menuScreen.TITLE;

// specific main menu stuff

main_final_x = width - x_gap;
slide_speed = 1;
main_button_t[0] = "Play";
main_button_t[1] = "Options";
main_button_t[2] = "Exit";
main_num_buttons = array_length_1d(main_button_t);
mainAnimFinished = false;

var main_spread = (height / 3.0 - y_gap)  / main_num_buttons;

spearIdx = 0;

for(var i = 0; i < main_num_buttons; i++) {
	main_button_x[main_num_buttons - i - 1] = width;
	main_button_y[main_num_buttons - i - 1] = height - (main_spread * (i+1));
}

// options menu stuff
optionAnimFinished = false;
optionBackgroundSel = false;
optionSoundEffSel = false;

option_button_t[0] = "Background Music Volume:    ";
option_button_t[1] = "Sound Effect Volume:    ";
option_button_t[2] = "Apply and Return";
option_num_buttons = array_length_1d(option_button_t);

option_button_arg[0] = 100;
option_button_arg[1] = 100;
option_button_arg[2] = "";

var option_spread = ((height / 2 - y_gap * 2) / 3);

volumeSwitch = true;

for(var i = 0; i < option_num_buttons; i++) {
	option_button_x[i] = width / 2;
	option_button_y[i] = option_spread * (i + 1) - y_gap * 4;
}

// character selection screen

var char_spread = (width - x_gap) / 4;

char_button_x[0] = width / 2; // num_players select position
char_button_y[0] = y_gap * 2;

char_button_t[0] = "Players:";
char_button_t[1] = "Player 1:";
char_button_t[2] = "Player 2:";
char_button_t[3] = "Player 3:";
char_button_t[4] = "Player 4:";

char_button_arg[0] = 2;
char_players_selected = false; // flag for when number of players has been chosen

for(var i = 1; i < 5; i++) {
	char_button_x[i] = char_spread * i - x_gap / 2; // position of character selection
	char_button_y[i] = height / 4;
}

for(var i = 0; i < 4; i++) {
	char_portrait_x[i] = char_button_x[i+1];
	char_portrait_y[i] = char_button_y[i+1] + 80;
}

draw_portrait = true;
char_num_buttons = array_length_1d(char_button_x);