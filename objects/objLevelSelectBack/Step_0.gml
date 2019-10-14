/// @description go back to main menu
if (mouse_check_button_released(mb_left) && position_meeting(mouse_x,mouse_y,self)) || (keyboard_check_pressed(vk_escape)) || (gamepad_button_check_pressed(global.gp_id,gp_face2)) || (position_meeting(global.mousex,global.mousey,self) && gamepad_button_check_pressed(global.gp_id,gp_face1))
{
	room_goto(rMenu);
}