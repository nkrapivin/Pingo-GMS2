/// @desc scrLoad()
global.loadbuff = buffer_create(1,buffer_grow,1);
global.loadid = buffer_load_async(global.loadbuff,"Pingo.sav",0,-1);