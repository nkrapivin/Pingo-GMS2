/// @description draw stuff
curworld = oLevelSelectorNew.selectedWorld;
unlocked = global.UnlockedLevels[curworld,doorind];
var sw = sprite_width*image_xscale;
var sh = sprite_height*image_yscale;
if (selected)
{
	y = ystart + sin(current_time/700)*5;
} else y = ystart;

//Draw Platform
draw_sprite_ext(sprDoorPlatform,0,x-5,y+10,image_xscale,image_yscale,0,c_white,1);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);

if (selected && unlocked)
{
	draw_sprite_ext(sprDoor,3,x,y,image_xscale,image_yscale,0,c_white,1);
}
else if (unlocked)
{
	draw_sprite_ext(sprDoor,0,x,y,image_xscale,image_yscale,0,c_white,1);
	draw_text(x+(sw/2),y+(sh/2)-15,string(doorind));
}
else if (selected)
{
	draw_sprite_ext(sprDoor,2,x,y,image_xscale,image_yscale,0,c_white,1);
	draw_sprite_ext(sprDoor,0,x,y,image_xscale,image_yscale,0,c_white,1);
	draw_text(x+(sw/2),y+(sh/2)-15,string(doorind));
	draw_sprite_ext(sprDoor,1,x,y,image_xscale,image_yscale,0,c_white,1);
}
else
{
	draw_sprite_ext(sprDoor,0,x,y,image_xscale,image_yscale,0,c_white,1);
	draw_text(x+(sw/2),y+(sh/2)-15,string(doorind));
	draw_sprite_ext(sprDoor,1,x,y,image_xscale,image_yscale,0,c_white,1);
}

if (!selected && unlocked)
{
	var starPosX,starPosY;
	var stars = global.StarCount[curworld,doorind];
	if (stars > 0)
	{
		starPosX = x + (sw/2) - 12+1;
		starPosY = y + (sh/2) - 3;
		draw_sprite_ext(sprStar,0,starPosX,starPosY,0.25,0.25,0,c_white,1);
	}
	else
	{
		starPosX = x + (sw/2) - 12+1;
		starPosY = y + (sh/2) - 3;
		draw_sprite_ext(sprStar,0,starPosX,starPosY,0.25,0.25,0,c_black,0.39);
	}
	
	if (stars > 1)
	{
		starPosX = x + (sw/2) - 25+1;
		starPosY = y + (sh/2) + 13;
		draw_sprite_ext(sprStar,0,starPosX,starPosY,0.25,0.25,0,c_white,1);
	}
	else
	{
		starPosX = x + (sw/2) - 25+1;
		starPosY = y + (sh/2) + 13;
		draw_sprite_ext(sprStar,0,starPosX,starPosY,0.25,0.25,0,c_black,0.39);
	}
	
	if (stars > 2)
	{
		starPosX = x + (sw/2) + 1+1;
		starPosY = y + (sh/2) + 13;
		draw_sprite_ext(sprStar,0,starPosX,starPosY,0.25,0.25,0,c_white,1);
	}
	else
	{
		starPosX = x + (sw/2) + 1+1;
		starPosY = y + (sh/2) + 13;
		draw_sprite_ext(sprStar,0,starPosX,starPosY,0.25,0.25,0,c_black,0.39);
	}
}