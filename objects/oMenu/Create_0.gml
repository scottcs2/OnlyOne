/// @description Insert description here
// You can write your code in this editor

height = display_get_gui_height()
width = display_get_gui_width();

show_debug_message("height");
show_debug_message(height);
y_gap = 50;
x_gap = 100;

final_x = width - x_gap;
slide_speed = 1;

// buttons
button_t[0] = "Play";
button_t[1] = "Options";
button_t[2] = "Exit";
num_buttons = array_length_1d(button_t);

menu_index = 0;
last_selected = 0;
animFinished = false;

var spread = (height / 3.0 - y_gap)  / num_buttons;

spearIdx = 0;

for(var i = 0; i < num_buttons; i++) {
	button_x[num_buttons - i - 1] = width;
	button_y[num_buttons - i - 1] = height - (spread * (i+1));
}