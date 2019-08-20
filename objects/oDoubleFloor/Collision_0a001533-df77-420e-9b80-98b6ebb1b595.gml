/// @description paint
if (image_index == 1) exit;
if (!Approached)
{
	Approached = true;
	if (!double)
	{
		image_index = 3;//painted once
		double = true;
	}
	else
	{
		image_index = 1;//painted twice
		global.PaintedTileCount++;
	}
}