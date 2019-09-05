/// @description cheatcode event
if (keyboard_lastkey == code[code_pos])
{
    code_pos++;
    if (code_pos >= array_length_1d(code))
    {
        oAnimatedBg.image_index = 3;
		show_debug_message("Praise the Grzybojad!"); //hehe
        code_pos = 0;
    }
} else code_pos = 0;