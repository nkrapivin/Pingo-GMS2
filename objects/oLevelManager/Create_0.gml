/// @description Load level
if (global.CurrentWorld == 1) || (global.CurrentWorld == 999)
{
	if (!audio_is_playing(sndWorld1Bgm)) audio_play_sound(sndWorld1Bgm,0,true);
}
else if (global.CurrentWorld == 2)
{
	if (global.CurrentLevel > 20)
	{
		if (audio_is_playing(sndWorld2Bgm2) || audio_is_playing(sndWorld2Bgm))
		{
			audio_stop_sound(sndWorld2Bgm2);
			audio_stop_sound(sndWorld2Bgm);
		}
		if (!audio_is_playing(sndWorld2Bgm3)) audio_play_sound(sndWorld2Bgm3,0,true);
	}
	else if (global.CurrentLevel > 10)
	{
		if (audio_is_playing(sndWorld2Bgm) || audio_is_playing(sndWorld2Bgm3))
		{
			audio_stop_sound(sndWorld2Bgm);
			audio_stop_sound(sndWorld2Bgm3);
		}
		if (!audio_is_playing(sndWorld2Bgm2)) audio_play_sound(sndWorld2Bgm2,0,true);
	}
	else
	{
		if (audio_is_playing(sndWorld2Bgm2) || audio_is_playing(sndWorld2Bgm3))
		{
			audio_stop_sound(sndWorld2Bgm2);
			audio_stop_sound(sndWorld2Bgm3);
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
	var file = file_text_open_read("levels/World"+wld+"/level"+lvl+".txt");
}
else //a custom level
{
	var file = file_text_open_read(global.CurrentLevel);
}

var num = 0;
while (!file_text_eof(file))
{
	line[num] = file_text_read_string(file);
	show_debug_message(line[num]);
	num++;
	file_text_readln(file);
}
file_text_close(file);
LevelPlayerSteps = 0;
NextSymbol = 1;
LevelIndex = real(scrReadFirstString(NextSymbol,line[0]));
show_debug_message("Level Index: " + string(LevelIndex));
LevelName = scrReadFirstString(NextSymbol,line[0]);
LevelTwoStars = real(scrReadFirstString(NextSymbol,line[0]));
LevelThreeStars = real(scrReadFirstString(NextSymbol,line[0]));
LevelCanThreeStars = true;
LevelCanTwoStars = false;

for (var a = 1; a < array_length_1d(line); a++)
{
	levelarr[a-1] = line[a];
	//levelarr[a-1] = scrCharToTile(line[a]);
}
line = 0; //free original array
ds_grid_for_tiles = ds_grid_create(string_length(levelarr[0]),array_length_1d(levelarr));
_LEVELX = (960 - (ds_grid_width(ds_grid_for_tiles)*30)) / 2;
_LEVELY = 50;
if (ds_grid_height(ds_grid_for_tiles)*30 < 544 - (_LEVELY * 2))
{
	_LEVELY = (544 - ds_grid_height(ds_grid_for_tiles)*30)/2;
}
show_debug_message(string(_LEVELX));
for (var i = 0; i < ds_grid_width(ds_grid_for_tiles); i++)
{
	for (var j = 0; j < ds_grid_height(ds_grid_for_tiles); j++)
	{
		if (is_undefined(ds_grid_get(ds_grid_for_tiles,i,j))) break;
		ds_grid_for_tiles[# i, j] = string_copy(levelarr[j],i+1,1);
		ds_grid_for_tiles[# i, j] = scrCharToTile(ds_grid_for_tiles[# i, j]);
	}
}
global.FloorTileCount = 0;
global.PaintedTileCount = 0;
global.LevelComplete = false;
lvlcomplete_selected = 1;
global.LevelPaused = false;
for (var i = 0; i < ds_grid_width(ds_grid_for_tiles); i++)
{
	for (var j = 0; j < ds_grid_height(ds_grid_for_tiles); j++)
	{
		var cur_val = ds_grid_for_tiles[# i,j];
		var _x = _LEVELX+(i*30);
		var _y = _LEVELY+(j*30);
		switch (cur_val)
		{
			case TILES.WALL_TILE:
				instance_create_layer(_x,_y,"Walls",oWall);
				break;
			case TILES.START_TILE:
				instance_create_layer(_x,_y,"Player",oBall);
				instance_create_layer(_x,_y,"Walls",oFloor);
				break;
			case TILES.FLOOR_TILE:
				instance_create_layer(_x,_y,"Walls",oFloor);
				break;
			case TILES.DOUBLEFLOOR_TILE:
				instance_create_layer(_x,_y,"Walls",oDoubleFloor);
				break;
			case TILES.STOP_TILE:
				instance_create_layer(_x,_y,"Walls",oFloor);
				instance_create_layer(_x,_y,"MiddleTiles",oFloorStop);
				break;
			case TILES.CONVEYOR0_TILE:
				with (instance_create_layer(_x+15,_y+15,"Walls",oFloorConveyor))
				{
					image_angle = scrIdToDirection(TILES.CONVEYOR0_TILE);
				}
				break;
			case TILES.CONVEYOR1_TILE:
				with (instance_create_layer(_x+15,_y+15,"Walls",oFloorConveyor))
				{
					image_angle = scrIdToDirection(TILES.CONVEYOR1_TILE);
				}
				break;
			case TILES.CONVEYOR2_TILE:
				with (instance_create_layer(_x+15,_y+15,"Walls",oFloorConveyor))
				{
					image_angle = scrIdToDirection(TILES.CONVEYOR2_TILE);
				}
				break;
			case TILES.CONVEYOR3_TILE:
				with (instance_create_layer(_x+15,_y+15,"Walls",oFloorConveyor))
				{
					image_angle = scrIdToDirection(TILES.CONVEYOR3_TILE);
				}
				break;
			default: show_message("UNKNOWN TILE! PLEASE INFORM DEVELOPER!\nSPAWNING REGULAR FLOOR TILE!"); instance_create_layer(_x,_y,"Walls",oFloor); break;
		}
	}
}
with (oWall) scrAutotile();