/// @description Set gp_id to new gamepad val
if (async_load != -1) //if async DS Map is valid at all
{
	var pad = async_load[? "pad_index"];
	if (async_load[? "event_type"] == "gamepad discovered")
	{
		show_debug_message("a gamepad was connected at index "+string(pad));
		global.gp_id = real(pad);
	}
	else if (async_load[? "event_type"] == "gamepad lost")
	{
		show_debug_message("gamepad was disconnected at index "+string(pad));
		global.gp_id = -1; //no gamepad
	}
}