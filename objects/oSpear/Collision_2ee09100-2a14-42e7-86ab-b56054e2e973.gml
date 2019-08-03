/// @description Insert description here
// You can write your code in this editor

if thrown && !grounded {
	if throwing == other {
		exit;
	}

	if !other.is_catching {
		other.dead = true;
		ds_list_add(impaled, other);
		audio_play_sound(hitSound, 1, false);
		exit;
	}
}

if other.dead {
	exit;
}

x = other.x;
y = other.y;
if(thrown) // we are catching
	audio_play_sound(catchSound, 1, false);
thrown = false;
vel = [0, 5];
grounded = false;
holding = other;