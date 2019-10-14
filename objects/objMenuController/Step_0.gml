/// @description Move menu
if (audio_group_is_loaded(ag_bgm) && !audio_is_playing(sndMenuBgm)) audio_play_sound(sndMenuBgm,0,true);

if (gamepad_axis_value(global.gp_id,gp_axislv) < 0.5) && (gamepad_axis_value(global.gp_id,gp_axislv) > -0.5)
	gp_timer = 0;
if (gp_timer > 0) gp_timer--;

var move = 0;
move += keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(global.gp_id,gp_padd) || gp_timer < 1 && gamepad_axis_value(global.gp_id,gp_axislv) > 0.5;
move -= keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.gp_id,gp_padu) || gp_timer < 1 && gamepad_axis_value(global.gp_id,gp_axislv) < -0.5;
if (move != 0)
{
	gp_timer = 10;
	selected_btn += move;
	if (selected_btn > 3) selected_btn = 1;
	if (selected_btn < 1) selected_btn = 3;
	audio_play_sound(sfxMenuMove,5,false);
	with (objMenuBtnPar)
	{
		image_index = 0;
		if (objMenuController.selected_btn == btn_ind) image_index = 1;
	}
}

push = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(global.gp_id,gp_face1) || gamepad_button_check_pressed(global.gp_id,gp_start);
if (push) event_user(0);

if (scrIsMobile())
{
	//you can't just press keyboard keys on mobile.
	if (mouse_check_button(mb_left) && !key_react)
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
		
			if (length > 60)
			{
				var angle = arctan2( dif[1], dif[0] );
				if ( angle < -7 * pi / 8 || angle > 7 * pi / 8 )
					keyboard_lastkey = vk_left;
				else if ( angle < pi / 8 && angle > -pi / 8 )
					keyboard_lastkey = vk_right;
				else if ( angle < -3 * pi / 8 && angle > -5 * pi / 8 )
					keyboard_lastkey = vk_up;
				else if ( angle > 3 * pi / 8 && angle < 5 * pi / 8 )
					keyboard_lastkey = vk_down;
				
				event_user(1);
				key_react = true;
				//free the arrays
				touch_pos = 0;
				dif = 0;
			}
		}
	}
	else if (!mouse_check_button(mb_left))
	{
		keyboard_lastkey = -1; key_react = false;
	}
}

if (keyboard_check_pressed(vk_anykey))
	event_user(1);
	
if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.gp_id,gp_select)) game_end();