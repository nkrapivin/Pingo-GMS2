/// @description swipe (ugly)
if (!scrIsMobile()) exit;
var _mx = mouse_x;
var _my = mouse_y;
var radius = 70;
if (!scrIsBetween(_mx,mx-radius,mx+radius)) //real drag
{
	if (_mx > mx) keyboard_key_press(vk_right);//right
	else if (_mx < mx) keyboard_key_press(vk_left);//left
	alarm[0] = 1;
	exit;
}
if (!scrIsBetween(_my,my-radius,my+radius)) //real drag
{
	if (_my < my) keyboard_key_press(vk_up);//up
	else if (_my > my) keyboard_key_press(vk_down);//down
	alarm[0] = 1;
	exit;
}