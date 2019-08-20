/// @description Init menu
display_set_gui_size(room_width,room_height);
audio_group_load(ag_bgm);
selected_btn = 1;

code = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right, ord("B"), ord("A")];
code_pos = 0;

global.door_ind = 1;