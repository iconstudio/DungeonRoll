/// @description 지도 편집기 초기화
enum editor_tool {
	cursor = 0,
	node_add,
	node_delete,
	brush,
	doodad
}

enum editor_cursor_state {
	normal,
	on_ui,
	on_outside
}

tool_mode = editor_tool.cursor
cursor_state = editor_cursor_state.normal

tool_datas = [[0, 0, "커서", -1], [32, 0, "추가", -1], [64, 0, "삭제", -1], [96, 0, "붓", -1], [128, 0, "장식물", -1]]
tool_number = array_length_1d(tool_datas)

editor_width = display_get_gui_width()
editor_height = display_get_gui_height()
