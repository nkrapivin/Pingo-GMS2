/// @desc scrPatchHoles
#macro WALLCOLOR make_color_rgb(144,145,194)
#macro WALLCOLOR2 make_color_rgb(110,142,110)
var blend;
if (global.CurrentWorld == 1) blend = WALLCOLOR;
else blend = WALLCOLOR2;
for (var i = 0; i < ds_grid_width(ds_grid_for_tiles); i++)
{
	for (var j = 0; j < ds_grid_height(ds_grid_for_tiles); j++)
	{
		var rows = ds_grid_width(ds_grid_for_tiles);
		var cols = ds_grid_height(ds_grid_for_tiles);
		if (i < (rows-1) && j < (cols-1))
		{
			var val1 = ds_grid_for_tiles[# i,j];
			var val2 = ds_grid_for_tiles[# i+1,j];
			var val3 = ds_grid_for_tiles[# i,j+1];
			var val4 = ds_grid_for_tiles[# i+1,j+1];
			if (val1 == TILES.WALL_TILE &&
				val2 == TILES.WALL_TILE &&
				val3 == TILES.WALL_TILE &&
				val4 == TILES.WALL_TILE )
			{
				draw_sprite_ext(sprWallFill,0,_LEVELX+(i*30)+25,_LEVELY+(j*30)+25,1,1,0,blend,1);
			}
		}
	}
}