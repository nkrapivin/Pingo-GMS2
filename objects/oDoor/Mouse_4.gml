/// @description goto level
if (unlocked)
{
	audio_stop_sound(sndMenuBgm);
	global.CurrentWorld = curworld;
	global.CurrentLevel = doorind;
	room_goto(rGame);
}