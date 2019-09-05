///
function file_ensure_js(path, content) {
	if (localStorage.getItem(path) == null) {
		localStorage.setItem(path, content);
		return 1;
	} else return 0;
}