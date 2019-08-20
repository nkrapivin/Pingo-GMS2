/// @desc scrSpawnDoors()
var w = sprite_get_width(sprDoor);
var h = sprite_get_height(sprDoor);
for (var i = 0; i < 10; i++)
{
	for (var j = 0; j < 3; j++)
	{
		instance_create_layer(x+(i*w),y+(j*h),layer,oDoor);
	}
}