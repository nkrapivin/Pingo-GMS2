/// @description options menu

if (gamepad_axis_value(global.gp_id,gp_axislv) < 0.5) && (gamepad_axis_value(global.gp_id,gp_axislv) > -0.5)
	gp_timer = 0;
	
if (gamepad_axis_value(global.gp_id,gp_axislh) < 0.5) && (gamepad_axis_value(global.gp_id,gp_axislh) > -0.5)
	gp_timer2 = 0;
	
if (gp_timer > 0) gp_timer--;
if (gp_timer2 > 0) gp_timer2--;

var move = 0;
move += keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(global.gp_id,gp_padd) || gp_timer < 1 && gamepad_axis_value(global.gp_id,gp_axislv) > 0.5;
move -= keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.gp_id,gp_padu) || gp_timer < 1 && gamepad_axis_value(global.gp_id,gp_axislv) < -0.5;
if (move != 0)
{
	gp_timer = 10;
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

var push = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.gp_id,gp_face2);
if (push) event_user(0);

var smove = 0;
var gmove = 0;
var smove = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
var gmove = gamepad_button_check_pressed(global.gp_id,gp_padr) - gamepad_button_check_pressed(global.gp_id,gp_padl);
if (smove != 0) var cur_move = smove;
else if (gmove != 0) var cur_move = gmove;
else var cur_move = 0;
if (cur_move != 0)
{
	gp_timer2 = 10;
	if (selected_btn == 1)
	{
		global.SndGain+=cur_move;
		if (global.SndGain > 10) global.SndGain = 10;
		if (global.SndGain < 0) global.SndGain = 0;
		var val = scr10th(global.SndGain);
		audio_group_set_gain(audiogroup_default,val,0);
	}
	if (selected_btn == 2)
	{
		global.BgmGain+=cur_move;
		if (global.BgmGain > 10) global.BgmGain = 10;
		if (global.BgmGain < 0) global.BgmGain = 0;
		var val = scr10th(global.BgmGain);
		audio_group_set_gain(ag_bgm,val,0);
	}
}