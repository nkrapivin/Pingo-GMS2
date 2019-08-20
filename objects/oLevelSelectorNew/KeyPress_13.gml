/// @description load custom level
if (selectedWorld == 3)
{
	global.CurrentLevel = working_directory + "custom_levels/" + menu[selfile];
	global.CurrentWorld = 999;
	audio_stop_sound(sndMenuBgm);
	room_goto(rGame);
}