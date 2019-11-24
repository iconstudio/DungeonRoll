/// @description 초기화
MODE_NONE = 0
MODE_EXAMPLE = 1
MODE_EXIT = 99
menu_mode = MODE_NONE

menu_depth_max = 0
menu_depth = 0

petagon_angle = 72
dodecahedron_dihedral_angle = arccos(-1 / sqrt(5))
golden_ratio = (1 + sqrt(5)) / 2
golden_ratio_reverse = 1 / golden_ratio
menu_rotation_basic = 270
menu_rotation_target = menu_rotation_basic
menu_rotation_begin = menu_rotation_target
menu_rotation = menu_rotation_target
menu_rotate_period = seconds(0.4)
menu_rotate_time = menu_rotate_period

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
