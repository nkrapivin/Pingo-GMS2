/// @desc scrAsyncLoadLevel(fname)
/// @arg fname
loaded = false;
global.levelbuff = buffer_create(1,buffer_grow,1);
global.levelid = buffer_load_async(global.levelbuff,argument0,0,-1);