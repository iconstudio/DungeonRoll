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

editor_width = display_get_gui_width()
editor_height = display_get_gui_height()

tool_mode = editor_tool.cursor
cursor_state = editor_cursor_state.normal

tool_frame_width = floor(editor_width * 0.2)
tool_frame_height = 108
tool_datas = [["커서", -1], ["추가", -1], ["삭제", -1], ["붓", -1], ["장식물", -1]]
tool_number = array_length_1d(tool_datas)

tool_captions = ["마우스 커서", "노드 추가", "노드 삭제", "스프라이트 배치", "장식물 배치"]
tool_caption_draw_y = tool_frame_height * 0.5



draw_set_font(fontEditor)
