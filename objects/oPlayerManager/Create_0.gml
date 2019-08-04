/// @description Insert description here
// You can write your code in this editor

is_debug = false
players = [undefined, undefined, undefined, undefined];
keyboard = undefined;

if !variable_global_exists("players") {
	is_debug = true;
} else {
	for (var i = 0; i < 4; ++i) {
		if global.players[i] < -1 {
			continue;
		}
	
		var player = instance_create_layer(room_width / 2, room_height / 2, "players", oPlayer);
		player.index = global.players[i];
	
		switch global.player_selections[i] {
			case 0:
				player.sIdle = sSpectreIdle;
				player.sWalk = sSpectreWalk;
				player.sJump = sSpectreJump;
				break;
			case 1:
				player.sIdle = sSkeleIdle;
				player.sWalk = sSkeleWalk;
				player.sJump = sSkeleJump;
				break;
			case 2:
				player.sIdle = sSnakeIdle;
				player.sWalk = sSnakeWalk;
				player.sJump = sSnakeJump;
				break;
			case 3:
				player.sIdle = sCatIdle;
				player.sWalk = sCatWalk;
				player.sJump = sCatJump;
				break;
		}
		
		players[i] = player;
	}
}
