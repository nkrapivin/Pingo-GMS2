/// @desc scrSave()
buffer_async_group_begin("PingoSaveData");

global.savebuff = buffer_create(1,buffer_grow,1);

ini_open_from_string("");

ini_write_real("Settings","BgmGain",global.BgmGain);
ini_write_real("Settings","SndGain",global.SndGain);

var inistring = ini_close();
buffer_write(global.savebuff,buffer_string,inistring);

buffer_save_async(global.savebuff,"Pingo.sav",0,buffer_get_size(global.savebuff));    // Pass the data to be saved
global.saveid = buffer_async_group_end();     // Start the save process