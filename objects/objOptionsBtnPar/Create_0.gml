/// @description init buttons
btn_ind = object_get_name(object_index);
if (btn_ind == "objOptionsBtn1") btn_ind = 1;
else if (btn_ind == "objOptionsBtn2") btn_ind = 2;
else btn_ind = -1;
if (object_index == objOptionsBtn1) image_index = 1;