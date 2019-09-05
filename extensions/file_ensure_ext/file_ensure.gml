#define file_ensure
/// @description  (path, ?content)
/// @param path
/// @param  ?content
var s = argument[0];
if (!file_exists(s)) {
	var f = file_text_open_write(s);
	if (f >= 0) {
		if (argument_count > 1) file_text_write_string(f, argument[1]);
		file_text_close(f);
	}
	return true;
} else return false;

