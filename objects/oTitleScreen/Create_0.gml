/// @description Insert description here
// You can write your code in this editor
height = display_get_gui_height();
width = display_get_gui_width();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

anim_fin = false;
anim_start = false;
spearIdx = 0;

spear_pos_x = width / 2;
spear_pos_y = height / 2;
show_debug_message("pos");
show_debug_message(spear_pos_x);
show_debug_message(spear_pos_y);

introSongPlayed = false;

enter_button_color = 0;

loop_ctr = 0;