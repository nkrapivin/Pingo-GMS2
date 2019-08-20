/// @desc scrSave()
buffer_async_group_begin("PingoSaveData");

global.savebuff = buffer_create(1,buffer_grow,1);

ini_open_from_string("");

for (var i = 1; i < 31; i++)
{
	ini_write_real("World1Unlocked",string(i),global.UnlockedLevels[1,i]);
	ini_write_real("World2Unlocked",string(i),global.UnlockedLevels[2,i]);
	ini_write_real("World1Stars",string(i),global.StarCount[1,i]);
	ini_write_real("World2Stars",string(i),global.StarCount[2,i]);
}

var inistring = ini_close();
buffer_write(global.savebuff,buffer_string,inistring);

buffer_save_async(global.savebuff,"Pingo.sav",0,buffer_get_size(global.savebuff));    // Pass the data to be saved
global.saveid = buffer_async_group_end();     // Start the save process