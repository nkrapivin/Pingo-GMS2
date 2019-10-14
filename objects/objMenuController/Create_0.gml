/// @description Init menu
audio_group_load(ag_bgm);
display_set_gui_size(room_width,room_height);
selected_btn = 1;

msg = -1;
//Initialize gamepad state.
var gp_num = gamepad_get_device_count();
show_debug_message("gamepad count reported to game : "+string(gp_num));
global.gp_id = -1;
gp_timer = 0;
for (var i = 0; i < gp_num; i++)
{
	if (gamepad_is_connected(i))
	{
		show_debug_message("GAMEPAD ID: " + string(i));
		show_debug_message("GAMEPAD DESC: " + gamepad_get_description(i));
		show_debug_message("GAMEPAD GUID (GMS2): " + gamepad_get_guid(i));
		gamepad_set_axis_deadzone(i,0.25);
		global.gp_id = i;
	}
	break;
}

if (!scrIsMobile())
{
	code = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right, ord("B"), ord("A")];
	//code_gamepad = [gp_padu, gp_padu, gp_padd, gp_padd, gp_padl, gp_padr, gp_padl, gp_padr, gp_face2, gp_face1];
}
else
{
	code = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right];
	mx = -1;
	my = -1;
	key_react = false;
}
code_pos = 0;

global.door_ind = 1;

if (os_browser != browser_not_a_browser) //if HTML5
{
	//window_set_size(display_get_width(),display_get_height());
	//alarm[0] = 1;
	show_debug_message("It's HTML5!");
	show_debug_message("Debug Mode: "+string(debug_mode));
	if (debug_mode)
		show_debug_overlay(true); //doesn't actually work in HTML5 lul
	show_debug_message("Current FPS: "+string(fps_real)); //for me it's 0 :(
}