/// @desc scrAngleFloor(angle)
/// @arg angle
var angle = floor(argument0);
hsp = 0;
vsp = 0;
if (scrIsBetween(angle,240,300)) //down
{
	vsp = 12;
	hsp = 0;
}
else if (scrIsBetween(angle,60,120)) //up
{
	vsp = -12;
	hsp = 0;
}
else if (scrIsBetween(angle,150,210)) //left
{
	vsp = 0;
	hsp = -12;
}
else if (scrIsBetween(angle,330,360) || scrIsBetween(angle,0,30)) //strange right
{
	vsp = 0;
	hsp = 12;
}