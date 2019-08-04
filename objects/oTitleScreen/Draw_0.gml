/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_title);

if !anim_start {
	draw_sprite(sAnimSpear, spearIdx, spear_pos_x, spear_pos_y);
	
	if enter_button_color > 7
		draw_set_color(c_yellow);
	else
		draw_set_color(c_white);
	draw_text(spear_pos_x, spear_pos_y * 1.4, "Enter to Begin");
}
else 
	draw_sprite(sAnimSpear, spearIdx, spear_pos_x, spear_pos_y);
