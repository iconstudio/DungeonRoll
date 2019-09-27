/// @description GUI 크기
var window_before_width = window_get_width()
var window_before_height = window_get_height()

if window_width != window_before_width or window_height != window_before_height {
	window_width = window_before_width
	window_height = window_before_height
	var gui_width = display_get_gui_width()
	var gui_height = display_get_gui_height()

	global.resolutions = [window_width, window_height]
	global.resolutions_gui = [gui_width, gui_height]
}
