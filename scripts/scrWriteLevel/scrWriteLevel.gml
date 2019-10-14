/// @desc scrWriteLevel(base64str,fname)
/// @arg base64str
/// @arg fname

//This script is designed to take base64 string and write it to a text file.
//So mobile users can use custom levels too!
var str = base64_decode(argument0);
var fname = argument1 + ".txt";
if (file_exists(fname)) file_delete(fname);
var file = file_text_open_write(fname);
file_text_write_string(file,str);
file_text_close(file);