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

editor_width = global.resolutions_gui[0]
editor_height = global.resolutions_gui[1]

draw_set_font(fontEditor)

menu_mode = editor_tool.cursor
menu_datas = [["커서", string_width("커서"), -1], ["추가", string_width("추가"), -1], ["삭제", string_width("삭제"), -1], ["붓", string_width("붓"), -1], ["장식물", string_width("장식물"), -1]]
menu_number = array_length_1d(menu_datas)
menu_captions = ["마우스 커서", "노드 추가", "노드 삭제", "스프라이트 배치", "장식물 배치"]

menu_frame_width_addition = 32
menu_frame_menu_height = 54
menu_frame_height = menu_frame_menu_height + 32
menu_frame_color = $f1f2f3

menu_frame_indicator_height = 4
menu_frame_indicator_color = $d49227
menu_frame_caption_y = menu_frame_height * 0.5 - menu_frame_indicator_height


cursor_state = editor_cursor_state.normal
cursor_gui_x = 0
cursor_gui_y = 0
cursor_node_x = mouse_x div 16 * 16
cursor_node_y = mouse_y div 16 * 16

node_selected = noone

camera_set_view_pos(view_camera[0], 0, -menu_frame_height - 108)
