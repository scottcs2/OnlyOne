/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_main);
draw_set_halign(fa_left);
//draw_set_valign(fa_top);
draw_set_color(c_ltgray);
draw_set_valign(fa_middle);

spearIdx = spearIdx >= sprite_get_number(oSpear) ? 0 : spearIdx + 0.1;

for(var i = 0; i < num_buttons; i++) {
	draw_set_color(c_ltgray);
	if (menu_index == i && animFinished) {
		draw_set_color(c_red);
		draw_sprite(oSpear, spearIdx, button_x[i] - 40, button_y[i]);
	}
	draw_text(button_x[i], button_y[i], button_t[i]);
}


