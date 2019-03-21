/// @description Hard drop key

if(!global.pause) {
	current_mino.hard_drop = true;
	audio_play_sound(snd_harddrop, 0, false);
}