/// @description check
if (variable_global_exists("splashShown"))
{
	show_debug_message("global.splashShown somehow exists, killing splash!");
	instance_destroy();
	exit;
}
global.splashShown = false;