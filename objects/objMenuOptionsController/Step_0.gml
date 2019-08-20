/// @description options menu

var move = 0;
move += keyboard_check_pressed(vk_down);
move -= keyboard_check_pressed(vk_up);
if (move != 0)
{
	selected_btn += move;
	if (selected_btn > 2) selected_btn = 1;
	if (selected_btn < 1) selected_btn = 2;
	with (objOptionsBtnPar)
	{
		image_index = 0;
		if (objMenuOptionsController.selected_btn == btn_ind) image_index = 1;
	}
}

var mpush = mouse_check_button_pressed(mb_left);
if (point_in_rectangle(mouse_x,mouse_y,
	objOptionsBtn1.x,objOptionsBtn1.y,
	objOptionsBtn1.x+objOptionsBtn1.sprite_width,objOptionsBtn1.y+objOptionsBtn1.sprite_height)
	&& mpush)
{
	objOptionsBtn1.image_index = 1;
	objOptionsBtn2.image_index = 0;
	selected_btn = 1;
}
else if (point_in_rectangle(mouse_x,mouse_y,
	objOptionsBtn2.x,objOptionsBtn2.y,
	objOptionsBtn2.x+objOptionsBtn2.sprite_width,objOptionsBtn2.y+objOptionsBtn2.sprite_height)
	&& mpush)
{
	objOptionsBtn1.image_index = 0;
	objOptionsBtn2.image_index = 1;
	selected_btn = 2;
}

var push = keyboard_check_pressed(vk_escape);
if (push) event_user(0);

var smove = 0;
var smove = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
if (smove != 0)
{
	if (selected_btn == 1)
	{
		global.SndGain+=smove;
		if (global.SndGain > 10) global.SndGain = 10;
		if (global.SndGain < 0) global.SndGain = 0;
		var val = scr10th(global.SndGain);
		audio_group_set_gain(audiogroup_default,val,0);
	}
	if (selected_btn == 2)
	{
		global.BgmGain+=smove;
		if (global.BgmGain > 10) global.BgmGain = 10;
		if (global.BgmGain < 0) global.BgmGain = 0;
		var val = scr10th(global.BgmGain);
		audio_group_set_gain(ag_bgm,val,0);
	}
}