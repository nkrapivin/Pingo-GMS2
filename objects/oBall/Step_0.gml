/// @description Main Player
if (!activated) exit;

if (gamepad_axis_value(global.gp_id,gp_axislv) < 0.5) && (gamepad_axis_value(global.gp_id,gp_axislv) > -0.5)
	gp_timery = 0;
	
if (gamepad_axis_value(global.gp_id,gp_axislh) < 0.5) && (gamepad_axis_value(global.gp_id,gp_axislh) > -0.5)
	gp_timerx = 0;
	
if (gp_timery > 0) gp_timery--;
if (gp_timerx > 0) gp_timerx--;

key_left = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(global.gp_id,gp_padl) || gp_timerx < 1 && gamepad_axis_value(global.gp_id,gp_axislh) < -0.5;
key_right = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(global.gp_id,gp_padr) || gp_timerx < 1 && gamepad_axis_value(global.gp_id,gp_axislh) > 0.5;
key_up = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.gp_id,gp_padu) || gp_timery < 1 && gamepad_axis_value(global.gp_id,gp_axislv) < -0.5;
key_down = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(global.gp_id,gp_padd) || gp_timery < 1 && gamepad_axis_value(global.gp_id,gp_axislv) > 0.5;

stoptimer = max(0,stoptimer-1);

if (mouse_check_button(mb_left) && stoptimer == 0 && !moving && scrIsMobile())
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
	gp_timerx = 10;
	gp_timery = 10;
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