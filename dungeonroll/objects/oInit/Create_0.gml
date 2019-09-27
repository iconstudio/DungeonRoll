/// @description 초기화
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)
global.flag_is_browser = (os_browser == browser_not_a_browser)

device_mouse_dbclick_enable(false)

#region 화면
// 9 : 16
var default_width = 496
var default_height = 912
window_set_fullscreen(true)

if global.flag_is_mobile {
	
} else if global.flag_is_browser {
	
} else {
	
}

var window_width = window_get_width()
var window_height = window_get_height()
display_set_gui_size(display_get_width(), display_get_height())
var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()

global.resolutions_default = [default_width, default_height]
global.resolutions = [window_width, window_height]
global.resolutions_gui = [gui_width, gui_height]
#endregion

#region 음성
if global.flag_is_mobile {
	audio_channel_num(16)
} else if global.flag_is_browser {
	audio_channel_num(4)
} else {
	audio_channel_num(32)
}
#endregion

instance_create_layer(0, 0, layer, oGlobal)

alarm[0] = 1
