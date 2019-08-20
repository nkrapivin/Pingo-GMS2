/// @description init buttons
btn_ind = object_get_name(object_index);
if (btn_ind == "objMenuBtn1") btn_ind = 1;
else if (btn_ind == "objMenuBtn2") btn_ind = 2;
else if (btn_ind == "objMenuBtn3") btn_ind = 3;
else btn_ind = -1;
if (object_index == objMenuBtn1) image_index = 1;