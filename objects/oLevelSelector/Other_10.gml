/// @description go to level
if (global.UnlockedLevels[curWorldSelected,curLevelSelected])
{
	global.CurrentLevel = curLevelSelected;
	global.CurrentWorld = curWorldSelected;
	audio_stop_sound(sndMenuBgm);
	room_goto(rGame);
}