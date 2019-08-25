/// @description swipe (ugly)
if (!activated || moving) || (!scrIsMobile()) exit;
var _mx = mouse_x;
var _my = mouse_y;
var _m = point_direction(mx,my,_mx,_my);
show_debug_message("POINT DIRECTION: " + string(_m));
var xradius = 70;
var yradius = xradius-20;//yes
if (!scrIsBetween(_mx,mx-xradius,mx+xradius) || (!scrIsBetween(_my,my-yradius,my+yradius))) //real drag
{
	scrAngleFloor(_m);
	if (hsp == 0) && (vsp == 0) exit;
	if (place_meeting(x+hsp,y,oWall) || place_meeting(x,y+vsp,oWall)) exit;
	moving = true;
	scrIncrementStep();
	exit;
}