/// @description init
upPos = 45;
downPos = 55;
curWorldSelected = 1;
curLevelSelected = 1;
mx = mouse_x;
my = mouse_y;
allstarcount = 0;
for (var i = 1; i < 31; i++)
{
	allstarcount += global.StarCount[curWorldSelected,i];
}