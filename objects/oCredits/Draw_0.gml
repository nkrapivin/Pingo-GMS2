/// @description draw text
draw_text(x,y,str);
if (mouse_check_button_pressed(mb_right)) show_message(string(y));
y -= 0.5;
if (y < -950) game_end();