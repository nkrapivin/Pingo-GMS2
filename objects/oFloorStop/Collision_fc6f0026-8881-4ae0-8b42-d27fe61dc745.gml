/// @description stop player
if (!Approached)
{
	Approached = true;
	oBall.moving = false;
	oBall.x = x;
	oBall.y = y;
	if (scrIsMobile())
	{
		mouse_clear(mb_left);
		oBall.stoptimer = 5;
	}
	audio_play_sound(sfxBallMove,5,false);
}