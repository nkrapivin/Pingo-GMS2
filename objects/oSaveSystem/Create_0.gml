/// @description init

if !(os_browser != browser_not_a_browser) && (file_exists("PingoSaveData/Pingo.sav"))
{
	show_debug_message("OLD SAVEDATA WAS FOUND! COPYING...");
	directory_create("default");
	file_copy("PingoSaveData/Pingo.sav","default/Pingo.sav");
	file_delete("PingoSaveData/Pingo.sav");
	directory_destroy("PingoSaveData");
	show_debug_message("DONE COPYING SAVEDATA!");
}

image_speed = 0;
global.loadid = -1;
global.saveid = -1;
global.levelid = -1;
global.loadbuff = -1;
global.savebuff = -1;
global.levelbuff = -1;
global.CurrentLevel = 1;
global.CurrentWorld = 1;

global.BgmGain = 10;
global.SndGain = 10;

//first levels are always unlocked
global.UnlockedLevels[1,1] = true;
global.UnlockedLevels[2,1] = true;
for (var i = 2; i < 31; i++)
{
	global.UnlockedLevels[1,i] = false;
	global.UnlockedLevels[2,i] = false;
}
for (var i = 1; i < 31; i++)
{
	global.StarCount[1,i] = 0;
	global.StarCount[2,i] = 0;
}

scrLoad();