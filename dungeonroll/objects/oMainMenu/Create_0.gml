/// @description 초기화
x = room_width * 0.5
y = room_height * 0.5
MODE_NONE = 0
MODE_EXAMPLE = 1
MODE_EXIT = 99
menu_mode = MODE_NONE
menu_depth_max = 0
menu_depth = 0
menu_depth_previous = 0

golden_ratio = (1 + sqrt(5)) * 0.5
golden_ratio_reverse = 1 / golden_ratio
petagon_angle = 72
pentagon_edge_length = 100
pentagon_tilt_angle = 90
event_user(0)

menu_perspective_distance = 600
menu_rotating_angle = 90
menu_rotating_angle_vertical = 180
menu_rotating = false
menu_rotate_period = seconds(0.2)
//
menu_rotation_basic_horizontal = 0
menu_rotation_basic_horizontal_push = 0
menu_rotation_target_horizontal = menu_rotation_basic_horizontal
menu_rotation_begin_horizontal = menu_rotation_target_horizontal
menu_rotation_horizontal = menu_rotation_begin_horizontal
menu_rotate_time_horizontal = menu_rotate_period
//
menu_rotation_basic_vertical = 0
menu_rotation_target_vertical = menu_rotation_basic_vertical
menu_rotation_begin_vertical = menu_rotation_target_vertical
menu_rotation_vertical = menu_rotation_begin_vertical
menu_rotate_time_vertical = menu_rotate_period

menu_extension_time = 0
menu_extension_period = seconds(0.6)
closing_time = 0
closing_period = seconds(0.9)

menu_item_render_distance_s = pentagon_edge_length + 20
menu_item_render_distance_l = pentagon_edge_length + 60
menu_items = []
menu_items_number = []
/*
	 real menu_items_position_y[depth]
	 int menu_item_selected[depth]
	 int menu_item_selected_previous[depth]
*/
menu_items_position = []
menu_item_selected = []
menu_item_selected_previous = []

/*
	 메뉴 위치
			[2]
		[1] [0]
			[3]
*/
draw_set_font(fontMenu)
menu_item_clear(0, 1)
menu_item_add(0, "도전", -1) // 오른쪽
menu_item_add(0, "게임", -1) // 왼쪽
menu_item_add(0, "설정", -1) // 위쪽
menu_item_add(0, "종료", -1) // 아래쪽
