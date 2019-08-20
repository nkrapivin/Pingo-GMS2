/// @description move
y -= 10;
if (y < 0)
{
	instance_destroy();
	show_debug_message("Splash freed!");
	sprite_delete(sprite);
}