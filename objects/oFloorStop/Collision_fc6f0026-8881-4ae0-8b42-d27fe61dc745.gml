/// @description stop player
if (!Approached)
{
	Approached = true;
	oBall.moving = false;
	oBall.x = x;
	oBall.y = y;
	audio_play_sound(sfxBallMove,5,false);
}