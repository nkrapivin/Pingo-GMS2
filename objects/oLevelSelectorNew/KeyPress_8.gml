/// @description write level as base64
if (selectedWorld != 3) && (os_browser != browser_not_a_browser || !scrIsMobile()) exit;//mobile only!!!
var fname = get_string("Enter level file name (no extension!):","custom");
var lvlstr= get_string("Enter level base64 string:","");
scrWriteLevel(lvlstr,fname);