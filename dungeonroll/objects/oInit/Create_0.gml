/// @description 초기화
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)
global.flag_is_browser = (os_browser == browser_not_a_browser)
global.network_available = os_is_network_connected()

device_mouse_dbclick_enable(false)

#region 화면
application_surface_enable(true)
application_surface_draw_enable(false)
global.application_texture = surface_get_texture(application_surface)
global.application_offset = application_get_position()

surface_depth_disable(true)
display_reset(8, true)
display_set_timing_method(tm_countvsyncs)

// 16 : 9
var default_width = 1600
var default_height = 900

if global.flag_is_mobile {
	display_set_sleep_margin(4)
	window_set_fullscreen(true)
	os_powersave_enable(false)
} else if global.flag_is_browser {
	display_set_sleep_margin(30)
} else {
	display_set_sleep_margin(20)
}
display_set_gui_maximize()
var display_width = display_get_width()
var display_height = display_get_height()
var window_width = window_get_width()
var window_height = window_get_height()
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

#region 편집기
enum editor_buffer_state {
	none,
	loading,
	saving
}

enum editor_menu {
	file = 0,
	node_modify,
	tile,
	doodad,
	entity,
	setting
}

global.editor_menu_last = editor_menu.setting

enum editor_cursor_state {
	normal,
	on_ui,
	on_outside
}

enum editor_background {
	black = 0,
	grid_inverse,
	grid_yellow,
	grid_red,
	grid_white
}
global.editor_grid_color = [0, $ffffff, $00ffff, $80, $b3b3b3]
global.editor_grid_color_info = array_create(5, [])
for (var i = 0; i < 5; ++i) {
	var color = global.editor_grid_color[i]
	global.editor_grid_color_info[i] = [color_get_hue(color), color_get_saturation(color), color_get_value(color)]
}

#endregion

#region 쉐이더
global.shader_supported = shaders_are_supported()
if global.shader_supported {
	if !shader_is_compiled(shaderFXAA)
		show_debug_message("shaderFXAA is not complied. Be careful!")
}
global.shaderFXAA_texel = shader_get_uniform(shaderFXAA, "u_texel")
global.shaderFXAA_strength = shader_get_uniform(shaderFXAA, "u_strength")
global.shaderBlur_texel_size = shader_get_uniform(shaderBlur, "texelSize")

#endregion

enum node_type {
	normal = 0,
	monster_spawner, // uses data (integer)
	monster_spanwer_once, // uses data (integer)
	random_harrass_encounter, // uses data (real), lesser bad encounter
	random_good_encounter, // uses data (real)
	random_upgrade_encounter, // uses data (integer)
	random_bad_encounter,  // uses data (real), bad encounter
	random_encounter, // uses data (integer), all encounter
	random_give_good, // uses data (integer)
	random_debuff, // uses data (integer), what kind of debuff (reduce dices, cannot move, etc...)
	dice_upgrade, // uses data (integer), what kind of dice
	dice_move_upgrade, // uses data (integer), for only moving dice
	text_popup, // uses data for caption (string), if it is array, than is transmission
	campaign_encounter // uses variety attributes
}

instance_create_layer(0, 0, layer, oGlobal)

alarm[0] = 1
