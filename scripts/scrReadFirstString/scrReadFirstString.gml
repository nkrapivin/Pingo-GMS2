/// @desc scrReadFirstString(ord,str)
/// @arg ord
/// @arg str
// argument0 = <ind>
var __return = "";
for (var i = argument0; i < string_length(argument1); i++)
{
	var sord = string_copy(argument1,i,1);
	if (sord == ">")
	{
		NextSymbol = i+1;
		break;
	}
	if (sord == "<")
	{
		var j = i+1;
		while (true)
		{
			if (string_copy(argument1,j,1) == ">") break;
			__return += string_copy(argument1,j,1);
			j++;
		}
	}
}

show_debug_message(__return);
return __return;