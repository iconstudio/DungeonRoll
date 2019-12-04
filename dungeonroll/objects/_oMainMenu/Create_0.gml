/// @description 초기화
//gpu_set_cullmode(cull_counterclockwise)
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

menu_edge_length = 160
menu_perspective_distance = -600
//
menu_rotate_angle = 90
menu_rotate_angle_vertical = 180
menu_rotating = false
menu_rotate_period = seconds(0.2)
menu_rotation_push_begin = 0
menu_rotation_push = menu_rotation_push_begin
menu_rotation = menu_rotation_push
menu_rotate_time = menu_rotate_period

/*
	 real menu_items_position[depth]
	 int menu_item_selected[depth]
	 int menu_item_selected_previous[depth]
	 int menu_item_sign
*/
menu_items = []
menu_items_number = []
menu_items_position = []
menu_item_selected = []
menu_item_selected_previous = []
NONE = -1
LEFT = 1
RIGHT = 0
UP = 2
DOWN = 3
menu_selection = NONE
menu_item_sign = LEFT

menu_extension_time = 0
menu_extension_period = seconds(0.6)
closing_time = 0
closing_period = seconds(0.9)

/*
	 메뉴 위치
			[2]
		[1] [0]
			[3]
*/
draw_set_font(fontMenu)

menu_position = array_create(4)
menu_position[0] = [menu_edge_length, 0]
menu_position[1] = [menu_edge_length, 180]
menu_position[2] = [menu_edge_length, 90]
menu_position[3] = [menu_edge_length, 270]

menu_item_clear(0, 1)
menu_item_add(0, "도전", menu_callback_challenge) // 오른쪽
menu_item_add(0, "게임", menu_callback_play) // 왼쪽
menu_item_add(0, "설정", -1) // 위쪽
menu_item_add(0, "종료", -1) // 아래쪽