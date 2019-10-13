/// @description 지도 편집기 초기화
doubletap = false
width = global.resolutions_gui[0]
height = global.resolutions_gui[1]
nodes_size_w = room_width div 16
nodes_size_h = room_height div 16
background = editor_background.grid_inverse

menu_number = 0
menu_mode = editor_menu.cursor
menu_mode_previous = menu_mode
menu_option = 0

menu_item_frame_height = 40
menu_tool_frame_height = 40
menu_frame_width_addition = 32
menu_frame_draw_width_appended = 0
menu_frame_height_min = menu_item_frame_height
menu_frame_height_max = menu_item_frame_height + menu_tool_frame_height
menu_frame_color = $f1f2f3
menu_frame_caption_y = menu_item_frame_height * 0.5

menu_submenu_width_addition = 16
menu_submenu_icon_width_addition = 4

event_user(1)

var menu_data = menu_items[0]
menu_mode_description = menu_data[2]

// 주 메뉴를 색깔있는 표시기로 강조
menu_frame_indicator_on = -1
menu_frame_indicator_width_half_begin = menu_data[1] * 0.5
menu_frame_indicator_width_half_target = menu_frame_indicator_width_half_begin
menu_frame_indicator_width_half = menu_frame_indicator_width_half_begin
menu_frame_indicator_period = seconds(0.09)
menu_frame_indicator_time = 0
menu_frame_indicator_width_half_actual = menu_frame_indicator_width_half
menu_frame_indicator_x_begin = menu_data[5]
menu_frame_indicator_x_target = menu_frame_indicator_x_begin
menu_frame_indicator_x = menu_frame_indicator_x_begin
menu_frame_indicator_x_period = seconds(0.4)
menu_frame_indicator_x_time = menu_frame_indicator_x_period
menu_frame_indicator_y = menu_item_frame_height - menu_frame_indicator_height
menu_frame_indicator_height = 4
menu_frame_indicator_color = $d49227

// 주 메뉴를 사각형으로 감싸서 강조
menu_frame_indicator_frame_previous = menu_mode // 마우스 전용
menu_frame_indicator_frame_alpha = 0
menu_frame_indicator_frame_left = 0
menu_frame_indicator_frame_right = 0
menu_frame_indicator_frame_time = 0
menu_frame_indicator_frame_period = seconds(0.09)

menu_submenu_y = menu_item_frame_height
menu_submenu_indicator_frame_left = 0
menu_submenu_indicator_frame_right = 0

menu_frame_extended = false // 보조 메뉴가 열려있는가
menu_frame_extend_time = 0
menu_frame_extend_period = seconds(0.07)
menu_frame_height = menu_frame_height_min

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

view_pos_hborder = camera_get_view_border_x(view_camera)
view_pos_vborder = camera_get_view_border_y(view_camera)
x = view_pos_hborder
y = view_pos_vborder
view_pos_x_limit = [view_pos_hborder, room_width - view_pos_hborder]
view_pos_y_limit = [view_pos_vborder - menu_frame_height, room_height - view_pos_vborder]
view_pos_x_begin = 0
view_pos_y_begin = 0
view_mover_x_begin = -1
view_mover_y_begin = -1
