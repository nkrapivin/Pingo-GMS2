/// @description paint & move
if (image_index != 1)
{
	image_index = 1;
	global.PaintedTileCount++;
}
if (!Approached)
{
	Approached = true;
	with (oBall)
	{
		x = other.x-15;
		y = other.y-15;
		hsp = other.hsp;
		vsp = other.vsp;
		moving = true;
	}
}