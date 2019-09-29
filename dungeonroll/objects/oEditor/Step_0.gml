/// @description 입력 및 갱신
cursor_gui_x = device_mouse_x_to_gui(0)
cursor_gui_y = device_mouse_y_to_gui(0)

if cursor_gui_x< 0 or cursor_gui_y < 0 or cursor_gui_x > global.resolutions_gui[0] or cursor_gui_y > global.resolutions_gui[1] {
	cursor_state = editor_cursor_state.on_outside
} else if cursor_gui_y < menu_frame_height {
	cursor_state = editor_cursor_state.on_ui

	window_set_cursor(cr_default)
} else {
	cursor_state = editor_cursor_state.normal
	if menu_mode == editor_tool.node_add {
		cursor_node_x = mouse_x div 16 * 16
		cursor_node_y = mouse_y div 16 * 16
	}

	if menu_mode == editor_tool.cursor
		window_set_cursor(cr_default)
	else if menu_mode == editor_tool.node_add
		window_set_cursor(cr_none)
	else if menu_mode == editor_tool.node_delete
		window_set_cursor(cr_cross)
	else
		window_set_cursor(cr_handpoint)
}

for (var i = editor_tool.cursor; i <= editor_tool.doodad; ++i) {
	if keyboard_check_pressed(49 + i) {
		menu_mode = i
	}
}
