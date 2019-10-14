/// @description hovering
if (point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height) || point_in_rectangle(global.mousex,global.mousey,x,y,x+sprite_width,y+sprite_height))
{
	var i_d = id;
	selected = true;
	with (oDoor)
	{
		if (id != i_d)
		{
			selected = false;
		}
	}
}

if (gamepad_button_check_pressed(global.gp_id,gp_face1) && position_meeting(global.mousex,global.mousey,self)) || (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,self))
{
	//goto level
	if (unlocked)
	{
		audio_stop_sound(sndMenuBgm);
		global.CurrentWorld = curworld;
		global.CurrentLevel = doorind;
		room_goto(rGame);
	}
}