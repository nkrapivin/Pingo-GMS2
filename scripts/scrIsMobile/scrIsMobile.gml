/// @desc scrIsMobile()
// Returns true if running on a mobile platform
if (os_type == os_android) || (os_type == os_ios) || (os_type == os_winphone) || (os_browser != browser_not_a_browser)
{
	return true;
}
else //not any of mobile OSes
{
	return false;
}
//cuz we can't be sure if browser is in fact a mobile browser......