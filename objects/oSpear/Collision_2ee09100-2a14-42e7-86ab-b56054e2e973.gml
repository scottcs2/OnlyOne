/// @description Insert description here
// You can write your code in this editor

if thrown && !grounded {
	if throwing == other {
		exit;
	}

	if !other.is_catching {
		other.dead = true;
		ds_list_add(impaled, other);
		exit;
	}
}

if other.dead {
	exit;
}

x = other.x;
y = other.y;
thrown = false;
vel = [0, 5];
grounded = false;
holding = other;
