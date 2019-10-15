/// @desc scrSave()
global.savebuff = buffer_create(1,buffer_grow,1);

ini_open_from_string("");

//bugfix
for (var i = 1; i < 31; i++)
{
	ini_write_real("World1Unlocked",string(i),global.UnlockedLevels[1,i]);
	ini_write_real("World2Unlocked",string(i),global.UnlockedLevels[2,i]);
	ini_write_real("World1Stars",string(i),global.StarCount[1,i]);
	ini_write_real("World2Stars",string(i),global.StarCount[2,i]);
}

ini_write_real("Settings","BgmGain",global.BgmGain);
ini_write_real("Settings","SndGain",global.SndGain);
var inistring = ini_close();

buffer_write(global.savebuff,buffer_string,inistring);
global.saveid = buffer_save_async(global.savebuff,"Pingo.sav",0,buffer_get_size(global.savebuff));