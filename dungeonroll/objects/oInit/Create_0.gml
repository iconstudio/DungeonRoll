/// @description 초기화
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)
global.flag_is_browser = (os_browser == browser_not_a_browser)

device_mouse_dbclick_enable(false)

#region 화면
application_surface_enable(true)
application_surface_draw_enable(false)
global.application_texture = -1
global.shaderBlur_texel_size = shader_get_uniform(shaderBlur, "texelSize")

surface_depth_disable(true)
display_reset(8, true)
display_set_timing_method(tm_countvsyncs)

// 16 : 9
var default_width = 1600
var default_height = 900

var display_width = display_get_width()
var display_height = display_get_height()
var window_width = window_get_width()
var window_height = window_get_height()
var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()
display_set_gui_maximize()

if global.flag_is_mobile {
	display_set_sleep_margin(4)
	window_set_fullscreen(true)
	os_powersave_enable(false)
} else if global.flag_is_browser {
	display_set_sleep_margin(30)
} else {
	display_set_sleep_margin(20)
}

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

#region 편집기
enum editor_menu {
	cursor = 0,
	node_modify,
	brush,
	doodad,
	instance,
	setting
}
global.editor_menu_last = editor_menu.setting

enum editor_cursor_state {
	normal,
	on_ui,
	on_outside
}

enum editor_background {
	black,
	grid_inverse,
	grid_yellow,
	grid_red,
	grid_white
}
#endregion

instance_create_layer(0, 0, layer, oGlobal)

alarm[0] = 1
