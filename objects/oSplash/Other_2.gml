/// @description flag

show_debug_message("This is an experimental Switch version! meow.");

if (!variable_global_exists("switchlogin")) global.switchlogin = switch_accounts_select_account(1, 0, 0);//actually useless.
switch_controller_support_set_defaults();
switch_controller_support_set_singleplayer_only(1);
switch_controller_set_supported_styles(7);
//i have no idea what this does.
if (switch_controller_support_show() == 0)
global.gp_id = (switch_controller_support_get_selected_id() + 1);
gamepad_set_axis_deadzone(global.gp_id,0.25);

sprite = sprite_add(working_directory+"splash.png",0,0,0,0,544);
sprite_index = sprite;
show_debug_message("Splash init!");
global.splashShown = true;