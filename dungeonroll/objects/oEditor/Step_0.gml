/// @description 입력 및 갱신
for (var i = editor_tool.cursor; i < editor_tool.doodad; ++i) {
	if keyboard_check_pressed(48 + i) {
		tool_mode = i
	}
}
