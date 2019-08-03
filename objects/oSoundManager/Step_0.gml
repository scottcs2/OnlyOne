/// @description Insert description here
// You can write your code in this editor


if !introPlayed && audio_group_is_loaded(Sound_Effects) {
	introPlayed = true;
	audio_play_sound(startSound, 1, false);
}

if !backgroundStarted && audio_group_is_loaded(Background_Music) {
	if !audio_is_playing(startSound) {
		audio_play_sound(backgroundMusic,1,true);
		backgroundStarted = true;
	}
}