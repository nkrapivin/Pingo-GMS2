/// @description Init menu
audio_group_load(ag_bgm);
display_set_gui_size(room_width,room_height);
selected_btn = 1;

if (!scrIsMobile())
code = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right, ord("B"), ord("A")];
else
{
	code = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right];
	mx = -1;
	my = -1;
	key_react = false;
}
code_pos = 0;

global.door_ind = 1;

if (os_browser != browser_not_a_browser)
{
	show_debug_message("It's HTML5!");
	show_debug_message("Debug Mode: "+string(debug_mode));
	if (debug_mode)
		show_debug_overlay(true); //doesn't actually work in HTML5 lul
	show_debug_message("Current FPS: "+string(fps_real)); //for me it's 0 :(
}