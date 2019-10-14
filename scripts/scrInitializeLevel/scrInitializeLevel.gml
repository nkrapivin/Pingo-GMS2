/// @desc scrInitializeLevel(str)
/// @arg str
var buffstring = argument0;
var file = file_text_open_from_string(buffstring);
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
LevelIndex = scrReadFirstString(NextSymbol,line[0]);
show_debug_message("LEVEL INDEX: " + LevelIndex);
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
loaded = true;
show_debug_message("Done!");