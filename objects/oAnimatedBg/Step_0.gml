/// @description yes
x += 0.3; y += 0.3;
image_blend = bg;
switch (room)
{
	case rMenu: case rMenuOptions: bg = BGCOLOR1; break;
	case rGame: if (global.CurrentWorld == 2) bg = BGCOLOR2; else bg = BGCOLOR1; break;
	case rLevelSelect:
	{
		with (oLevelSelector)
		{
			if (curWorldSelected == 1) other.bg = BGCOLOR1;
			else other.bg = BGCOLOR2;
		}
	}
	default: break;
}