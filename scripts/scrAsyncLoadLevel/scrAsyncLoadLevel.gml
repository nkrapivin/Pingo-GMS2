/// @desc scrAsyncLoadLevel(fname)
/// @arg fname
loaded = false;
oSaveSystem.PerformEvent = false;
global.loadbuff = buffer_create(1,buffer_grow,1);
global.loadid = buffer_load_async(global.loadbuff,argument0,0,-1);