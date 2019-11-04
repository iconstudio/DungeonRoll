/// @description 시점 이동
var cursor_left_pressed = device_mouse_check_button_pressed(0, mb_left)

var view_xview_new = map_x
var view_yview_new = map_y

// 휠로 시점 이동 도중
if view_mover_dragging and device_mouse_check_button(0, view_mover_key) {
	if view_mover_x_begin != -1 and view_mover_y_begin != -1 {
		view_xview_target = view_pos_x_begin + (cursor_x - view_mover_x_begin) * 1
		view_yview_target = view_pos_y_begin + (cursor_y - view_mover_y_begin) * 1
	}
}

{ // 방향키로 시점 이동
	var view_mover_horizontal = keyboard_check(vk_right) - keyboard_check(vk_left)
	var view_mover_vertical = keyboard_check(vk_down) - keyboard_check(vk_up)

	if view_mover_horizontal != 0
		view_xview_target += view_mover_horizontal * view_pos_speed
	if view_mover_vertical != 0
		view_yview_target += view_mover_vertical * view_pos_speed
}

// 휠로 시점 이동 시작
if cursor_state == editor_cursor_state.normal and !view_mover_dragging {
	var touch_pressed = (view_moveable_with_touch and cursor_left_pressed)
	var middle_pressed = device_mouse_check_button_pressed(0, mb_middle)
	if touch_pressed or middle_pressed {
		if middle_pressed
			view_mover_key = mb_middle
		else if touch_pressed
			view_mover_key = mb_left

		view_pos_x_begin = view_xview_new
		view_pos_y_begin = view_yview_new
		view_mover_x_begin = cursor_x
		view_mover_y_begin = cursor_y

		view_mover_dragging = true
	}
}

if device_mouse_check_button_released(0, view_mover_key) {
	view_mover_dragging = false

	view_mover_x_begin = -1
	view_mover_y_begin = -1
}

// 실질적 시점 이동
if view_yview_adjusted != view_xview_target or view_yview_adjusted != view_yview_target {
	view_xview_adjusted += (view_xview_target - view_xview_adjusted) * 0.1
	view_yview_adjusted += (view_yview_target - view_yview_adjusted) * 0.1

	map_x = view_xview_adjusted
	map_y = view_yview_adjusted
}
map_x = clamp(map_x, view_limit[0], view_limit[2])
map_y = clamp(map_y, view_limit[1], view_limit[3])
