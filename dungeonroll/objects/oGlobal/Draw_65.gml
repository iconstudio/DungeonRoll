/// @description GUI 크기 조정
display_set_gui_maximise()

var window_width = window_get_width()
var window_height = window_get_height()
var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()

global.resolutions = [window_width, window_height]
global.resolutions_gui = [gui_width, gui_height]
