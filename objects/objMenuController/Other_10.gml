/// @description Push Event
audio_play_sound(sfxMenuMove,5,false);
switch (selected_btn)
{
	case 1: room_goto(rGame); audio_stop_sound(sndMenuBgm); break;
	case 2: room_goto(rLevelSelectNew); break;
	case 3: room_goto(rMenuOptions); break;
	default: break;
}