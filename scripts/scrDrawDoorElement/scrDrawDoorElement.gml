/// @desc scrDrawDoorElement(posx,posy,selected,id)
/// @arg posx
/// @arg posy
/// @arg selected
/// @arg id
#macro TEXTCOLOR make_color_rgb(65,11,25)
draw_set_color(TEXTCOLOR);
if (argument2 && global.UnlockedLevels[curWorldSelected,argument3])
{
	
	yOffset = sin( animation ) * 10;
	draw_sprite(sprDoorPlatform,0,argument0-5,argument1+10+yOffset);
}
else
{
	draw_sprite(sprDoorPlatform,0,argument0-5,argument1+10);
}

if (argument2 && global.UnlockedLevels[curWorldSelected,argument3])
{
	draw_sprite(sprDoor,3,argument0,argument1+yOffset);
}
else if (global.UnlockedLevels[curWorldSelected,argument3])
{
	draw_sprite(sprDoor,0,argument0,argument1);
	draw_set_font(fntMainfont);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_bottom);
	draw_text_transformed(argument0+(itemWidth/2),argument1+(itemHeight/2)-30,string(argument3),1,1,0);
}
else if (argument2)
{
	draw_sprite(sprDoor,2,argument0,argument1);
	draw_sprite(sprDoor,0,argument0,argument1);
	draw_text_transformed(argument0+(itemWidth/2),argument1+(itemHeight/2)-30,string(argument3),1,1,0);
	draw_sprite(sprDoor,1,argument0,argument1);
}
else
{
	draw_sprite(sprDoor,0,argument0,argument1);
	draw_text_transformed(argument0+(itemWidth/2),argument1+(itemHeight/2)-30,string(argument3),1,1,0);
	draw_sprite(sprDoor,1,argument0,argument1);
	
}