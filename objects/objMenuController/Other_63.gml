/// @description Enable debug overlay
if (async_load[? "id"] == msg)
{
	if (async_load[? "status"])
		show_debug_overlay(true);
	else
		msg = -1;
}