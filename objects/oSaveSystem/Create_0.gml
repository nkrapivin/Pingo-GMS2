/// @description init
global.loadid = -1;
global.saveid = -1;
global.loadbuff = -1;
global.savebuff = -1;
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