/// @description 입력 및 갱신
if device_mouse_y_to_gui(0) < tool_frame_height
	cursor_state = editor_cursor_state.on_ui

for (var i = editor_tool.cursor; i <= editor_tool.doodad; ++i) {
	if keyboard_check_pressed(49 + i) {
		tool_mode = i
	}
}
