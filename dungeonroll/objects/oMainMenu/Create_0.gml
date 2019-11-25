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
pentagon_radius = pentagon_edge_length * sqr(golden_ratio) * 0.5
dodecahedron_point = array_create(20, [])
dodecahedron_point[00] = [1, 1, 1]
dodecahedron_point[01] = [golden_ratio_reverse, 0, golden_ratio] // blue
dodecahedron_point[02] = [1, -1, 1]
dodecahedron_point[03] = [golden_ratio, -golden_ratio_reverse, 0] // pink
dodecahedron_point[04] = [golden_ratio, golden_ratio_reverse, 0] // pink
dodecahedron_point[05] = [1, 1, -1]
dodecahedron_point[06] = [golden_ratio_reverse, 0, -golden_ratio] // blue
dodecahedron_point[07] = [0, -golden_ratio, golden_ratio_reverse] // green
dodecahedron_point[08] = [1, -1, -1]
dodecahedron_point[09] = [0, -golden_ratio, -golden_ratio_reverse] // green
dodecahedron_point[10] = [-golden_ratio_reverse, 0, -golden_ratio] // blue
dodecahedron_point[11] = [-1, -1, -1]
dodecahedron_point[12] = [-golden_ratio, -golden_ratio_reverse, 0] // pink
dodecahedron_point[13] = [-golden_ratio, golden_ratio_reverse, 0] // pink
dodecahedron_point[14] = [-1, 1, 1]
dodecahedron_point[15] = [-golden_ratio_reverse, 0, golden_ratio] // blue
dodecahedron_point[16] = [-1, 1, -1]
dodecahedron_point[17] = [0, golden_ratio, -golden_ratio_reverse] // green
dodecahedron_point[18] = [0, golden_ratio, golden_ratio_reverse] // green
dodecahedron_point[19] = [-1, -1, 1]

dodecahedron_dihedral_angle = arccos(-1 / sqrt(5)) + 30
dodecahedron_dihedral_angle_reverse = 180 - dodecahedron_dihedral_angle
dodecahedron_dihedral_angle_sine = dsin(dodecahedron_dihedral_angle)
dodecahedron_under_height = pentagon_radius * (2 - sqrt(3)) * 5 / 6
dodecahedron_width_middle = pentagon_edge_length * golden_ratio * 0.5

dodecahedron_height = pentagon_edge_length + dodecahedron_under_height

menu_rotation_basic = 270
menu_rotation_target = menu_rotation_basic
menu_rotation_begin = menu_rotation_target
menu_rotation = menu_rotation_target
menu_rotate_period = seconds(0.4)
menu_rotate_time = menu_rotate_period
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
