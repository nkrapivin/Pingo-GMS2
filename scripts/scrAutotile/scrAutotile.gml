/// @desc scrAutotile()
var BS,WR,WL,WU,WD;
BS = sprite_width;

WR = position_meeting(x + BS, y, oWall);
WL = position_meeting(x - BS, y, oWall);
WU = position_meeting(x, y + BS, oWall);
WD = position_meeting(x, y - BS, oWall);

if (!WR && !WL && !WU && !WD)
	image_index = 0; //no
if (!WR && WL && !WU && !WD)
	image_index = 1; //left
if (!WR && !WL && !WU && WD)
	image_index = 8; //down
if (!WR && WL && !WU && WD)
	image_index = 9; //leftdown
if (WR && !WL && !WU && !WD)
	image_index = 4; //right
if (WR && WL && !WU && !WD)
	image_index = 5; //rightleft
if (WR && !WL && !WU && WD)
	image_index = 12; //rightdown
if (WR && WL && !WU && WD)
	image_index = 13; //leftrightdown
if (!WR && !WL && WU && !WD)
	image_index = 2; //up
if (!WR && WL && WU && !WD)
	image_index = 3; //leftup
if (!WR && !WL && WU && WD)
	image_index = 10; //updown
if (!WR && WL && WU && WD)
	image_index = 11; //leftupdown
if (WR && !WL && WU && !WD)
	image_index = 6; //rightup
if (WR && WL && WU && !WD)
	image_index = 7; //rightleftup
if (WR && !WL && WU && WD)
	image_index = 14; //uprightdown
if (WR && WL && WU && WD)
	image_index = 15; //all