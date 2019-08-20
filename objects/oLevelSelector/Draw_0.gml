/// @description draw stuff
//draw lr triggers
draw_set_font(fntMainfont);
draw_set_color(c_black);
if (keyboard_check(vk_left))
	draw_sprite(sprTriggers,0,960/2-250,downPos);
else
	draw_sprite(sprTriggers,0,960/2-250,upPos);
	
if (keyboard_check(vk_right))
	draw_sprite(sprTriggers,1,960/2+180,downPos);
else
	draw_sprite(sprTriggers,1,960/2+180,upPos);
	
if (curWorldSelected != 3)
{
	draw_sprite(sprWorld,0,960/2-140,30);
	draw_sprite_ext(sprStar,0,960-40,15,0.30,0.30,0,c_white,1);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	var starstr = string(allstarcount);
	draw_text(960-40,15,starstr+"/90");
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_text_transformed(960/2-200,544/2,"Level " + string(curLevelSelected),2,2,0);
	var unlocked="No";
	if (global.UnlockedLevels[curWorldSelected,curLevelSelected])
	unlocked = "Yes";
	draw_text_transformed(960/2+200,544/2,"Unlocked: "+unlocked+"\nStars: "+string(global.StarCount[curWorldSelected,curLevelSelected]),2,2,0);
}
if (curWorldSelected == 1)
	draw_sprite(sprNumbers,0,960/2+110,20);
else if (curWorldSelected == 2)
	draw_sprite(sprNumbers,1,960/2+110,20);
else
{
	draw_set_font(fntMainfont);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	draw_text_transformed(960/2,50,"Custom",2,2,0);
	draw_text(960/2,544/2,"No levels found");
}
	
var move = 0;
move = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
if (move != 0)
{
	curWorldSelected += move;
	if (curWorldSelected > 3) curWorldSelected = 1;
	if (curWorldSelected < 1) curWorldSelected = 3;
	if (curWorldSelected != 3)
	{
		allstarcount = 0;
		for (var i = 1; i < 31; i++)
		{
			allstarcount += global.StarCount[curWorldSelected,i];
		}
	}
}

var smove = 0;
smove = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
if (smove != 0)
{
	curLevelSelected += smove;
	if (curLevelSelected > 30) curLevelSelected = 1;
	if (curLevelSelected < 1) curLevelSelected = 30;
}

var push = keyboard_check_pressed(vk_enter);
if (push) event_user(0);