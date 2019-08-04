/// @description Insert description here
// You can write your code in this editor

if thrown && !grounded {
	if throwing == other {
		exit;
	}

	if !other.is_catching {
		other.dead = true;
		other.impaled = self;
		ds_list_add(impaled, other);
		audio_play_sound(hitSound, 1, false);
		exit;
	}
}

if other.dead {
	exit;
}

for (var i = 0; i < ds_list_size(impaled); ++i) {
	var player = ds_list_find_value(impaled, i);
	player.impaled = undefined;
}

ds_list_clear(impaled);

if thrown {
	x = other.x;
	y  = other.y;
	audio_play_sound(catchSound, 1, false);
	thrown = false;
	vel = [0, 5];
	grounded = false;
	holding = other;
}