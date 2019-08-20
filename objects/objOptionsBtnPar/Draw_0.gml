/// @description draw
if (image_index == 0) draw_self();
else
{
	draw_sprite(sprite_index,1,x,y);
	draw_sprite(sprite_index,0,x,y);
}

for (var i = 0; i < 10; i++)
{
	var mpush = mouse_check_button(mb_left);
	if (object_index == objOptionsBtn2)
	{
		draw_sprite(sprSliders,0,345+(i*40),210);
		for (var j = 0; j < global.SndGain; j++)
		draw_sprite(sprSliders,1,345+(j*40),210);
	}
	if (object_index == objOptionsBtn1)
	{
		draw_sprite(sprSliders,0,345+(i*40),300);
		for (var a = 0; a < global.BgmGain; a++)
		draw_sprite(sprSliders,1,345+(a*40),300);
	}
}

for (var i = 0; i < 10+1; i++)
{
	if (point_in_rectangle(mouse_x,mouse_y,345+(i*40),300,(345+(i*40))+23,300+54) && mpush)
	{
		global.BgmGain = i;
		audio_group_set_gain(ag_bgm,scr10th(global.BgmGain),0);
	}
	if (point_in_rectangle(mouse_x,mouse_y,345+(i*40),210,(345+(i*40))+23,210+54) && mpush)
	{
		global.SndGain = i;
		audio_group_set_gain(audiogroup_default,scr10th(global.SndGain),0);
	}
}