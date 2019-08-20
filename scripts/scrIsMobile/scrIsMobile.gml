/// @desc scrIsMobile()
// Returns true if running on a mobile platform
if (os_type == os_android) || (os_type == os_ios) || (os_type == os_winphone)
{
	return true;
}
else //not any of mobile OSes
{
	return false;
}