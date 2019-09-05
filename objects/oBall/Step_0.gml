/// @description Main Player
if (!activated) exit;

key_left = keyboard_check_pressed(vk_left);
key_right = keyboard_check_pressed(vk_right);
key_up = keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(vk_down);

if (mouse_check_button(mb_left) && !moving && scrIsMobile())
{
	touch_pos[1] = mouse_y;
	touch_pos[0] = mouse_x;
	if (mouse_check_button_pressed(mb_left))
	{
		mx = mouse_x;
		my = mouse_y;	
	}
	else
	{
		var dif,length;
		dif[1] = touch_pos[1] - my;
		dif[0] = touch_pos[0] - mx;
		length = sqrt( dif[0] * dif[0] + dif[1] * dif[1] );
		
		if (length > 100)
		{
			var angle = arctan2( dif[1], dif[0] );
			key_left = ( angle < -7 * pi / 8 || angle > 7 * pi / 8 );
			key_right = ( angle < pi / 8 && angle > -pi / 8 );
			key_up = ( angle < -3 * pi / 8 && angle > -5 * pi / 8 );
			key_down = ( angle > 3 * pi / 8 && angle < 5 * pi / 8 );
			
			//free the arrays
			touch_pos = 0;
			dif = 0;
		}
	}
}
else if (mouse_check_button(mb_left) && moving && scrIsMobile())
{
	key_left = false; key_right = false; key_up = false; key_down = false;
}

var moveh = key_right - key_left;
var movev = key_down - key_up;
if (!moving) && ((moveh != 0) || (movev != 0))
{
	if (place_meeting(x+moveh,y,oWall) || place_meeting(x,y+movev,oWall)) exit;
	scrIncrementStep();
	moving = true;
	if (moveh != 0)
	{
		hsp = moveh * 12;
		vsp = 0;
	}
	else if (movev != 0)
	{
		hsp = 0;
		vsp = movev * 12;
	}
}

if (moving)
{
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall)) x += sign(hsp);
		hsp = 0;
		moving = false;
		audio_play_sound(sfxBallMove,5,false);
	}
	
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall)) y += sign(vsp);
		vsp = 0;
		moving = false;
		audio_play_sound(sfxBallMove,5,false);
	}

	x += hsp;
	y += vsp;
}
if (global.FloorTileCount == global.PaintedTileCount)
{
	activated = false;
	global.LevelComplete = true;
	audio_play_sound(sfxLevelFinish,5,false);
}