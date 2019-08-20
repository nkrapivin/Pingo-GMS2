var ident = async_load[? "id" ];
var status = async_load[? "status"];
var error = async_load[? "error"];

// Saving 
if (ident == global.saveid)
{ 
   buffer_delete(global.savebuff);
   show_debug_message("saved data status " + string(status) + " error " + string(error));
}
else if (ident == global.loadid)
{
   var buffstring = buffer_read(global.loadbuff,buffer_string);
   ini_open_from_string(buffstring);
   
   for (var i = 1; i < 31; i++)
   {
	   global.UnlockedLevels[1,i] = ini_read_real("World1Unlocked",string(i),false);
	   global.UnlockedLevels[2,i] = ini_read_real("World2Unlocked",string(i),false);
	   global.StarCount[1,i] = ini_read_real("World1Stars",string(i),0);
	   global.StarCount[2,i] = ini_read_real("World2Stars",string(i),0);
   }
   
   //hackfix
   global.UnlockedLevels[1,1] = true;
   global.UnlockedLevels[2,1] = true;
   
   global.BgmGain = ini_read_real("Settings","BgmGain",10);
   global.SndGain = ini_read_real("Settings","SndGain",10);
   audio_group_set_gain(audiogroup_default,scr10th(global.SndGain),0);
   audio_group_set_gain(ag_bgm,scr10th(global.BgmGain),0);

   ini_close();
   buffer_delete(global.loadbuff);
   show_debug_message("read string from buffer " + buffstring);
}