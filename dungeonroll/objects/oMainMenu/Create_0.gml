/// @description 초기화
x = room_width * 0.5
y = room_height * 0.5
MODE_NONE = 0
MODE_EXAMPLE = 1
MODE_EXIT = 99
menu_mode = MODE_NONE
menu_depth_max = 0
menu_depth = 0

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

menu_items = []
menu_items_number = []
menu_item_selected = []
menu_item_selected_previous = []



//menu_item_clear(0, 1)
//menu_item_add(0, "멀티 플레이", menu_callback_multiplay, "", 0.5)
//menu_item_add(0, "싱글 플레이", menu_callback_singleplay)
//menu_item_add(0, "게임 불러오기", menu_callback_loadsaved)
//menu_item_add(0, "달성 과제", menu_callback_achievements)
//menu_item_add(0, "설정", menu_callback_setting)
//menu_item_add(0, "게임 종료", menu_callback_exit)

draw_set_color($ffffff)
draw_set_halign(0)
draw_set_valign(0)
