/// @description Main Player
if (!activated) exit;

key_left = keyboard_check_pressed(vk_left);
key_right = keyboard_check_pressed(vk_right);
key_up = keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(vk_down);
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