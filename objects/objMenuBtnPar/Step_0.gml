/// @description highlight
if (position_meeting(mouse_x,mouse_y,object_index))
{
	with (objMenuController)
	{
		selected_btn = other.btn_ind;
		with (objMenuBtnPar)
		{
			image_index = 0;
			if (objMenuController.selected_btn == btn_ind) image_index = 1;
		}
	}
}