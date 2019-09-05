/// @description draw text
draw_text(x,y,str);
y -= 0.5;
if (y < -1010)
{
	audio_stop_sound(sndCreditsBgm);
	room_goto(rMenu);
}