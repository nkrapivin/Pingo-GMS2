/// @desc scrLoad()

global.loadbuff = buffer_create(1,buffer_grow,1);

buffer_async_group_begin("PingoSaveData");    // save folder 

buffer_load_async(global.loadbuff,"Pingo.sav",0,-1);   // Say what we want to load and into which buffer

global.loadid = buffer_async_group_end();   // Actually start loading now please