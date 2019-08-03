/// @description Insert description here
// You can write your code in this editor

vel[0] = 0;
vel[1] = 0;
grounded = true;

for (var i = 0; i < ds_list_size(impaled); ++i) {
	var player = ds_list_find_value(impaled, i);
	player.x = x;
	player.y = y;
}
	
ds_list_clear(impaled);