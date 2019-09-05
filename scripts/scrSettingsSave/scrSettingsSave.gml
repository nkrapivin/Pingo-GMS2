/// @desc scrSave()
global.savebuff = buffer_create(1,buffer_grow,1);

ini_open_from_string("");
ini_write_real("Settings","BgmGain",global.BgmGain);
ini_write_real("Settings","SndGain",global.SndGain);
var inistring = ini_close();

buffer_write(global.savebuff,buffer_string,inistring);
global.saveid = buffer_save_async(global.savebuff,"Pingo.sav",0,buffer_get_size(global.savebuff));