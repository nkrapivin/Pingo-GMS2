/// @description Load level
gp_timer = 0;
line = 0;
line[0] = "0";
if (global.CurrentWorld == 1) || (global.CurrentWorld == 999)
{
	if (audio_is_playing(sndWorld2Bgm) || audio_is_playing(sndWorld2Bgm2) || audio_is_playing(sndWorld2Bgm3))
	{
		audio_group_stop_all(ag_bgm);
	}
	if (!audio_is_playing(sndWorld1Bgm)) audio_play_sound(sndWorld1Bgm,0,true);
}
else if (global.CurrentWorld == 2)
{
	if (global.CurrentLevel > 20)
	{
		if (audio_is_playing(sndWorld1Bgm) || audio_is_playing(sndWorld2Bgm) || audio_is_playing(sndWorld2Bgm2))
		{
			audio_group_stop_all(ag_bgm);
		}
		if (!audio_is_playing(sndWorld2Bgm3)) audio_play_sound(sndWorld2Bgm3,0,true);
	}
	else if (global.CurrentLevel > 10)
	{
		if (audio_is_playing(sndWorld1Bgm) || audio_is_playing(sndWorld2Bgm) || audio_is_playing(sndWorld2Bgm3))
		{
			audio_group_stop_all(ag_bgm);
		}
		if (!audio_is_playing(sndWorld2Bgm2)) audio_play_sound(sndWorld2Bgm2,0,true);
	}
	else
	{
		if (audio_is_playing(sndWorld1Bgm) || audio_is_playing(sndWorld2Bgm2) || audio_is_playing(sndWorld2Bgm3))
		{
			audio_group_stop_all(ag_bgm);
		}
		if (!audio_is_playing(sndWorld2Bgm)) audio_play_sound(sndWorld2Bgm,0,true);
	}
}
if (global.CurrentWorld != 999)
{
	var lvl = string(global.CurrentLevel); // current level number
	var wld = string(global.CurrentWorld);
	if (string_length(global.CurrentLevel) < 3)
	{
		var zeros_to_add = 3 - string_length(global.CurrentLevel);
		
		for (var i = 0; i < zeros_to_add; i++)
		{
			lvl = string_insert("0",lvl,1);
		}
	}
	var file_path = "levels/World"+wld+"/level"+lvl+".txt";
	show_debug_message("Loading level from... "+file_path);
	scrAsyncLoadLevel(file_path);
}
else //a custom level
{
	scrAsyncLoadLevel(global.CurrentLevel);
}