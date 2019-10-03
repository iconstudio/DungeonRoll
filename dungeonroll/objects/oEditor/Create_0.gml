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
menu_number = 0
editor_menu_add("커서", "마우스 커서", -1)
editor_menu_add("추가", "노드 추가", -1)
editor_menu_add("삭제", "노드 삭제", -1)
editor_menu_add("스프라이트", "스프라이트 배치", -1)
editor_menu_add("장식물", "장식물 배치", -1)

menu_frame_width_addition = 32
menu_frame_menu_height = 32
menu_frame_height = menu_frame_menu_height + 32
menu_frame_color = $f1f2f3

menu_frame_indicator_height = 4
menu_frame_indicator_color = $d49227
menu_frame_caption_y = menu_frame_height * 0.5
menu_frame_indicator_y = menu_frame_caption_y + menu_frame_indicator_height

cursor_state = editor_cursor_state.normal
cursor_gui_x = 0
cursor_gui_y = 0
cursor_node_x = mouse_x div 16 * 16
cursor_node_y = mouse_y div 16 * 16

node_selected = noone

camera_set_view_pos(view_camera[0], 0, -menu_frame_height - 108)
