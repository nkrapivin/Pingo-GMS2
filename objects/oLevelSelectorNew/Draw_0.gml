/// @description draw header
draw_set_font(fntMainfont);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_black);
if (selectedWorld == 1)
{
	oAnimatedBg.bg = BGCOLOR1;
	draw_sprite(sprWorld,0,960/2-140,30);
	draw_sprite(sprNumbers,0,960/2+110,20);
}
else if (selectedWorld == 2)
{
	oAnimatedBg.bg = BGCOLOR2;
	draw_sprite(sprWorld,0,960/2-140,30);
	draw_sprite(sprNumbers,1,960/2+110,20);
}
else
{
	draw_text_transformed(960/2,50,"Custom",2,2,0);
	if (file != "")
	{
		var move = 0;
		move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		if (move != 0)
		{
			selfile += move;
			if (selfile < 0) selfile = array_length_1d(menu) - 1;
			if (selfile > array_length_1d(menu) - 1) selfile = 0;
		}
		for (var i = 0; i < array_length_1d(menu); i++)
		{
			if (selfile == i) draw_set_color(c_purple);
			else draw_set_color(c_black);
			draw_text(960/2,130+(i*32),menu[i]);
			draw_set_color(c_black);
		}
	}
	else
	{
		if (!scrIsMobile())
			draw_text(960/2,544/2,"No custom levels were found.\nYou can drop them to:\nGame Folder\\custom_levels");
		else if (os_browser != browser_not_a_browser) //is HTML5
			draw_text(960/2,544/2,"Custom Levels aren't supported on HTML5.\nSorry about that!\nJust click left trigger.");
		else if (scrIsMobile())
			draw_text(960/2,544/2,"Mobile platforms do not support custom levels.");
	}
}

//clickable triggers
//75 40
var mpush = mouse_check_button_pressed(mb_left);
if (mpush && point_in_rectangle(mouse_x,mouse_y,960/2-250,55,(960/2-250)+75,55+40))
{ //left trigger
	keyboard_key_press(vk_left);
	alarm[0] = 1;
}
else if (mpush && point_in_rectangle(mouse_x,mouse_y,960/2+180,55,(960/2+180)+75,55+40))
{
	keyboard_key_press(vk_right);
	alarm[0] = 1;
}

var move = 0;
var gmove = 0;
move = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
gmove = gamepad_button_check_pressed(global.gp_id,gp_shoulderr) - gamepad_button_check_pressed(global.gp_id,gp_shoulderl);
if (move != 0) var cur_move = move;
else if (gmove != 0) var cur_move = gmove;
else var cur_move = 0;
if (cur_move != 0)
{
	selectedWorld = max(1,selectedWorld+cur_move);
	if (selectedWorld == 3)
	{
		instance_deactivate_object(oDoor);
	}
	else if (!instance_exists(oDoor))
	{

		instance_activate_object(oDoor);
	}
	if (selectedWorld > 3) selectedWorld = 1;
	if (selectedWorld < 1) selectedWorld = 3;
	if (selectedWorld != 3)
	{
		allstarcount = 0;
		for (var i = 1; i < 31; i++)
		{
			allstarcount += global.StarCount[selectedWorld,i];
		}
	}
}

if (keyboard_check(vk_left) || gamepad_button_check(global.gp_id,gp_shoulderl))
{
	draw_sprite(sprTriggers,0,960/2-250,downPos);
}
else
{
	draw_sprite(sprTriggers,0,960/2-250,upPos);
}

if (keyboard_check(vk_right) || gamepad_button_check(global.gp_id,gp_shoulderr))
{
	draw_sprite(sprTriggers,1,960/2+180,downPos);
}
else
{
	draw_sprite(sprTriggers,1,960/2+180,upPos);
}

if (selectedWorld != 3)
{
	draw_sprite_ext(sprStar,0,960-40,15,0.30,0.30,0,c_white,1);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	var starstr = string(allstarcount);
	draw_text(960-40,15,starstr+"/90");
}

if (global.gp_id == -1) exit;
global.mousex += gamepad_axis_value(global.gp_id,gp_axislh) * 4;
global.mousey += gamepad_axis_value(global.gp_id,gp_axislv) * 4;
draw_sprite(sprBall,0,global.mousex,global.mousey);