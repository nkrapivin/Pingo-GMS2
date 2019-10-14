/// @description Draw Level Name + Stars
draw_set_font(fntMainfont);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_black);
if (!loaded)
{
	draw_text(960/2,544/2,"Loading...");
}
else
{
	scrPatchHoles();
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

	if (!global.LevelComplete) && (gamepad_button_check_pressed(global.gp_id,gp_start) || keyboard_check_released(vk_escape))
	{
		oBall.activated = false;
		global.LevelPaused = !global.LevelPaused;
	}

	if (!global.LevelComplete) && (!global.LevelPaused) && (gamepad_button_check_pressed(global.gp_id,gp_face4) || keyboard_check_pressed(ord("R")))
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
		
		if (gamepad_axis_value(global.gp_id,gp_axislv) < 0.5) && (gamepad_axis_value(global.gp_id,gp_axislv) > -0.5)
			gp_timer = 0;
		if (gp_timer > 0) gp_timer--;
		
		var move = 0;
		move += keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(global.gp_id,gp_padd) || gp_timer < 1 && gamepad_axis_value(global.gp_id,gp_axislv) > 0.5;
		move -= keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.gp_id,gp_padu) || gp_timer < 1 && gamepad_axis_value(global.gp_id,gp_axislv) < -0.5;
		if (move != 0)
		{
			gp_timer = 10;
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
		var push = keyboard_check(vk_enter) || gamepad_button_check_pressed(global.gp_id,gp_face1);
		var mpush = mouse_check_button_pressed(mb_left);
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
								audio_group_stop_all(ag_bgm);
							}
							var credits = false;
							if (global.CurrentWorld == 3) //if you completed world 2, go to credits room
							{
								var credits = true;
							}
							global.UnlockedLevels[global.CurrentWorld,global.CurrentLevel] = true;
							
							//unlock & save.
							scrSave();
							
							if (!credits) room_restart();
							else room_goto(rCredits);
						}
						else
						{
							audio_group_stop_all(ag_bgm);
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
					audio_group_stop_all(ag_bgm);
					room_goto(rMenu);
					break;
				}
				default: break;
			}
		}
	}
}