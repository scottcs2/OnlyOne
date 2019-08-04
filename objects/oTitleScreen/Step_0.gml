/// @description Insert description here
// You can write your code in this editor


if anim_fin && loop_ctr > 0
	room_goto(menu_screen);


if anim_start {
	
	spearIdx += 0.35;
	
	if spearIdx >= 61 {
		anim_fin = true;
		spearIdx = 41;
		loop_ctr++;
	}
	
}
else {

	enter_button_color += 0.1;
	spearIdx = 0;
		
	if enter_button_color > 10
		enter_button_color = 0;
}

if !introSongPlayed && audio_group_is_loaded(Sound_Effects) && spearIdx > 1 {
	introSongPlayed = true;
	audio_play_sound(startSound, 1, false);
}