/// @description init
selectedWorld = 1;
upPos = 45;
downPos = 55;
selecteddoor = 1;
allstarcount = 0;
for (var i = 1; i < 31; i++)
{
	allstarcount += global.StarCount[selectedWorld,i];
}
if (os_browser != browser_not_a_browser)
{
	file = "";
	selfile = 0;
	exit;
}
file = "";
selfile = 0;
if (directory_exists(working_directory + "custom_levels"))
{
	file = file_find_first(working_directory + "custom_levels/*.txt",0);
	if (file != "")
	{
	    menu[0] = file;
	    filepos = 1;
	    while (true)
	    {
	        var i = file_find_next();
	        if (i == "") break;
	        else
	        {
	            menu[filepos] = i;
	            filepos++;
	        }
	    }
	}
}