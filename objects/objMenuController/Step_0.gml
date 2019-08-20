/// @description Move menu
if (audio_group_is_loaded(ag_bgm) && !audio_is_playing(sndMenuBgm)) audio_play_sound(sndMenuBgm,0,true);

var move = 0;
move += keyboard_check_pressed(vk_down);
move -= keyboard_check_pressed(vk_up);
if (move != 0)
{
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

push = keyboard_check_pressed(vk_enter);
if (push) event_user(0);

if (keyboard_check_pressed(vk_anykey))
{
    if (keyboard_lastkey == code[code_pos])
    {
        code_pos++;
        if (code_pos >= array_length_1d(code))
        {
            oAnimatedBg.image_index = 3;
            code_pos = 0;
        }
    } else code_pos = 0;
}