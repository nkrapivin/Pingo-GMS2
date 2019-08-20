/// @description Draw Level Name + Stars
scrPatchHoles();
draw_set_font(fntMainfont);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_black);
draw_text(room_width/2,40,LevelName);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(10,10,"Steps",0.6,0.6,0);
var LevelStepsString = string(LevelPlayerSteps);
if (LevelCanThreeStars)
{
	LevelStepsString += "/"+string(LevelThreeStars);
}
else if (LevelCanTwoStars)
{
	LevelStepsString += "/"+string(LevelTwoStars);
}
else if (!LevelCanThreeStars) && (!LevelCanTwoStars) {}
draw_text_transformed(10,30,LevelStepsString,0.9,0.9,0);

//draw stars
if (LevelCanThreeStars)
{
	draw_sprite_ext(sprStar,0,10 + (0 * 20),60,0.25,0.25,0,c_white,1);
	draw_sprite_ext(sprStar,0,10 + (1 * 20),60,0.25,0.25,0,c_white,1);
	draw_sprite_ext(sprStar,0,10 + (2 * 20),60,0.25,0.25,0,c_white,1);
}
else if (LevelCanTwoStars)
{
	draw_sprite_ext(sprStar,0,10 + (0 * 20),60,0.25,0.25,0,c_white,1);
	draw_sprite_ext(sprStar,0,10 + (1 * 20),60,0.25,0.25,0,c_white,1);
	draw_sprite_ext(sprStar,0,10 + (2 * 20),60,0.25,0.25,0,c_black,0.5);
}
else if (!LevelCanThreeStars) && (!LevelCanTwoStars)
{
	draw_sprite_ext(sprStar,0,10 + (0 * 20),60,0.25,0.25,0,c_white,1);
	draw_sprite_ext(sprStar,0,10 + (1 * 20),60,0.25,0.25,0,c_black,0.5);
	draw_sprite_ext(sprStar,0,10 + (2 * 20),60,0.25,0.25,0,c_black,0.5);
}

if (!global.LevelComplete) && (keyboard_check_released(vk_escape))
{
	oBall.activated = false;
	global.LevelPaused = !global.LevelPaused;
}

if (!global.LevelComplete) && (!global.LevelPaused) && (keyboard_check_pressed(ord("R")))
room_restart();

//level complete screen
if (global.LevelComplete) || (global.LevelPaused)
{
	if (global.LevelPaused)
	{
		draw_set_alpha(0.5);
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height,false);
		draw_set_alpha(1);
	}
	var move = 0;
	move += keyboard_check_pressed(vk_down);
	move -= keyboard_check_pressed(vk_up);
	if (move != 0)
	{
		lvlcomplete_selected += move;
		if (lvlcomplete_selected > 3) lvlcomplete_selected = 1;
		if (lvlcomplete_selected < 1) lvlcomplete_selected = 3;
	}
	if (global.LevelComplete)
	{
		draw_sprite(sprSigns,1,231,26);
		if (LevelCanThreeStars)
		{
			draw_sprite_ext(sprStar,0,355 + (0 * 90),180,1,1,0,c_white,1);
			draw_sprite_ext(sprStar,0,355 + (1 * 90),180,1,1,0,c_white,1);
			draw_sprite_ext(sprStar,0,355 + (2 * 90),180,1,1,0,c_white,1);
		}
		else if (LevelCanTwoStars)
		{
			draw_sprite_ext(sprStar,0,355 + (0 * 90),180,1,1,0,c_white,1);
			draw_sprite_ext(sprStar,0,355 + (1 * 90),180,1,1,0,c_white,1);
			draw_sprite_ext(sprStar,0,355 + (2 * 90),180,1,1,0,c_black,0.5);
		}
		else if (!LevelCanThreeStars) && (!LevelCanTwoStars)
		{
			draw_sprite_ext(sprStar,0,355 + (0 * 90),180,1,1,0,c_white,1);
			draw_sprite_ext(sprStar,0,355 + (1 * 90),180,1,1,0,c_black,0.5);
			draw_sprite_ext(sprStar,0,355 + (2 * 90),180,1,1,0,c_black,0.5);
		}
	}
	else draw_sprite(sprSigns,0,231,26);
	var push = keyboard_check(vk_enter);
	var mpush = mouse_check_button(mb_left);
	if (point_in_rectangle(mouse_x,mouse_y,304,261,304+325,261+110))
	{
		lvlcomplete_selected = 1;
		if (mpush) push = true;
	}
	else if (point_in_rectangle(mouse_x,mouse_y,322,333,322+280,333+130))
	{
		lvlcomplete_selected = 2;
		if (mpush) push = true;
	}
	else if (point_in_rectangle(mouse_x,mouse_y,327,413,327+295,413+130))
	{
		lvlcomplete_selected = 3;
		if (mpush) push = true;
	}
	switch (lvlcomplete_selected)
	{
		case 1: if (global.LevelComplete) draw_sprite(sprLevelComplete1,1,304,261);
		else draw_sprite(sprPause1,1,304,261);
		break;
		case 2: draw_sprite(sprLevelComplete2,1,322,333); break;
		case 3: draw_sprite(sprLevelComplete3,1,327,413); break;
		default: break;
	}
	if (global.LevelComplete) draw_sprite(sprLevelComplete1,0,304,261);
	else draw_sprite(sprPause1,0,304,261);
	draw_sprite(sprLevelComplete2,0,322,333);
	draw_sprite(sprLevelComplete3,0,327,413);
	if (push)
	{
		switch (lvlcomplete_selected)
		{
			case 1:
			{
				if (global.LevelComplete)
				{
					if (global.CurrentWorld != 999)
					{
						if (LevelCanThreeStars) && (!LevelCanTwoStars)
						global.StarCount[global.CurrentWorld,global.CurrentLevel] = 3;
						else if (!LevelCanThreeStars) && (LevelCanTwoStars)
						global.StarCount[global.CurrentWorld,global.CurrentLevel] = 2;
						else if (!LevelCanThreeStars) && (!LevelCanTwoStars)
						global.StarCount[global.CurrentWorld,global.CurrentLevel] = 1;
					
						global.CurrentLevel++;
						if (global.CurrentLevel == 31) //completed world 1
						{
							global.CurrentLevel = 1;
							global.CurrentWorld++;
							audio_stop_sound(sndWorld1Bgm);
						}
						var credits = false;
						if (global.CurrentWorld == 3) //credits (not yet)
						{
							var credits = true;
						}
						global.UnlockedLevels[global.CurrentWorld,global.CurrentLevel] = true;
						if (!credits) room_restart();
						else room_goto(rCredits);
					}
					else
					{
						audio_stop_sound(sndWorld1Bgm);
						room_goto(rMenu);
					}
				}
				else
				{
					global.LevelPaused = false;
					oBall.activated = true;
				}
				break;
			}
			case 2:
			{
				room_restart();
				break;
			}
			case 3:
			{
				
				if (global.CurrentWorld != 999) scrSave();
				audio_stop_sound(sndWorld1Bgm);
				audio_stop_sound(sndWorld2Bgm);
				audio_stop_sound(sndWorld2Bgm2);
				audio_stop_sound(sndWorld2Bgm3);
				room_goto(rMenu);
				break;
			}
			default: break;
		}
	}
}