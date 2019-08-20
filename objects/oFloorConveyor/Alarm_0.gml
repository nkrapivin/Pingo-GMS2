/// @description init my hsp/vsp for player
switch (image_angle)
{
	case 0: //right
	{
		hsp = 12;
		vsp = 0;
		break;
	}
	case 90://up
	{
		hsp = 0;
		vsp = -12;
		break;
	}
	case 180://left
	{
		hsp = -12;
		vsp = 0;
		break;
	}
	case 270://down
	{
		hsp = 0;
		vsp = 12;
		break;
	}
	default: break;
}