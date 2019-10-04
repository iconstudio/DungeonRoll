/// @description 지도 편집기 초기화
enum editor_menu {
	cursor = 0,
	node_modify,
	node_release,
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
editor_nodes_size_w = 29
editor_nodes_size_h = 58

menu_number = 0
menu_mode = editor_menu.cursor
menu_mode_previous = menu_mode
menu_option = 0

menu_frame_width_addition = 32
menu_frame_draw_width_appended = 0
menu_frame_menu_height = 32
menu_frame_height = menu_frame_menu_height + 32
menu_frame_color = $f1f2f3

draw_set_font(fontEditorMenu)
// [0항목의 제목, 1제목 너비, 2설명, 3콜백, 4항목의 전체 너비, 5제목이 그려질 x 좌표]
editor_menu_add("선택", "마우스 커서", -1)
editor_menu_add("노드", "노드 추가 및 삭제하기", -1)
editor_menu_add("정리", "노드 삭제 및 자동 연결하기", -1)
editor_menu_add("스프라이트", "스프라이트 배치하기", -1)
editor_menu_add("장식물", "장식물 배치하기", -1)
draw_set_font(fontEditor)

var menu_data = menu_items[0]
menu_frame_indicator_x_begin = menu_data[5]
menu_frame_indicator_x_target = menu_frame_indicator_x_begin
menu_frame_indicator_x = menu_frame_indicator_x_begin
menu_frame_indicator_x_period = seconds(0.4)
menu_frame_indicator_x_time = menu_frame_indicator_x_period

menu_frame_indicator_on = -1
menu_frame_indicator_width_half_begin = menu_data[1] * 0.5
menu_frame_indicator_width_half_target = menu_frame_indicator_width_half_begin
menu_frame_indicator_width_half = menu_frame_indicator_width_half_begin
menu_frame_indicator_period = seconds(0.09)
menu_frame_indicator_time = 0
menu_frame_indicator_width_half_actual = menu_frame_indicator_width_half

menu_frame_indicator_frame_previous = menu_mode // 마우스 전용
menu_frame_indicator_frame_alpha = 0
menu_frame_indicator_frame_left = 0
menu_frame_indicator_frame_right = 0
menu_frame_indicator_frame_period = seconds(0.09)
menu_frame_indicator_frame_time = 0

menu_frame_indicator_height = 4
menu_frame_indicator_color = $d49227
menu_frame_caption_y = menu_frame_height * 0.5
menu_frame_indicator_y = menu_frame_caption_y + menu_frame_indicator_height
menu_mode_description = menu_data[2]

cursor_state = editor_cursor_state.normal
cursor_x = 0
cursor_y = 0
cursor_gui_x = 0
cursor_gui_y = 0
cursor_node_x = 0
cursor_node_y = 0

node_modify_link_add = false
node_selected = noone
node_on_cursor = noone

camera_set_view_pos(view_camera, 0, 0)
view_mover_dragging = false
view_pos_x_begin = 0
view_pos_y_begin = 0
view_pos_x_limit = [0, room_width - camera_get_view_width(view_camera)]
view_pos_y_limit = [0, room_height - camera_get_view_height(view_camera)]
view_mover_x_begin = -1
view_mover_y_begin = -1
