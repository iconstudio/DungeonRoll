/// @description 입력 및 갱신
cursor_gui_x = device_mouse_x_to_gui(0)
cursor_gui_y = device_mouse_y_to_gui(0)

if cursor_gui_x < 0 or cursor_gui_y < 0 or global.resolutions_gui[0] < cursor_gui_x or global.resolutions_gui[1] < cursor_gui_y {
	cursor_state = editor_cursor_state.on_outside
} else if 0 <= cursor_gui_y and cursor_gui_y < menu_frame_height {
	cursor_state = editor_cursor_state.on_ui

	// 마우스로 메뉴 항목 선택
	if cursor_gui_y < menu_frame_indicator_y {
		var i, menu_data
		for (i = 0; i < menu_number; ++i) {
			menu_data = menu_items[i]

			var frame_width_half = menu_data[4] * 0.5
			var frame_left = menu_data[5] - frame_width_half
			var frame_right = menu_data[5] + frame_width_half
			if frame_left <= cursor_gui_x and cursor_gui_x < frame_right {
				// 표시기 위치 정하기
				menu_frame_indicator_open_left = frame_left
				menu_frame_indicator_open_right = frame_right

				// 새로운 메뉴 가리키기
				if menu_frame_indicator_open_previous != i {
					menu_frame_indicator_open_time = 0

					menu_frame_indicator_open_previous = i
				}

				if menu_frame_indicator_open_time < menu_frame_indicator_open_period
					menu_frame_indicator_open_time++
				else
					menu_frame_indicator_open_time = menu_frame_indicator_open_period

				if device_mouse_check_button_pressed(0, mb_left)
					editor_menu_select(i)
			}
		}
	}

	window_set_cursor(cr_default)
} else {
	cursor_state = editor_cursor_state.normal
	if menu_mode == editor_tool.node_add {
		cursor_node_x = mouse_x div 16 * 16
		cursor_node_y = mouse_y div 16 * 16
	}

	if menu_mode == editor_tool.cursor
		window_set_cursor(cr_default)
	else if menu_mode == editor_tool.node_add
		window_set_cursor(cr_none)
	else if menu_mode == editor_tool.node_delete
		window_set_cursor(cr_cross)
	else
		window_set_cursor(cr_handpoint)
}

var indicator_open_ratio = menu_frame_indicator_open_time / menu_frame_indicator_open_period
// 인터페이스 상주 중이 아니면 강조 해제
if menu_frame_indicator_y <= cursor_gui_y or cursor_state != editor_cursor_state.on_ui {
	menu_frame_indicator_open_alpha = (indicator_open_ratio)

	if menu_frame_indicator_x == menu_frame_indicator_x_target {
		if 0 < menu_frame_indicator_open_time
			menu_frame_indicator_open_time--
		else
			menu_frame_indicator_open_time = 0
	}
} else {
	menu_frame_indicator_open_alpha = (indicator_open_ratio)
}

// 숫자 키로 메뉴 항목 선택
for (var i = editor_tool.cursor; i <= editor_tool.doodad; ++i) {
	if keyboard_check_pressed(49 + i)
		editor_menu_select(i)
}

// 시간 증감
if menu_frame_indicator_x_time < menu_frame_indicator_x_period {
	var indicator_ratio = ease_out_quartic(menu_frame_indicator_x_time / menu_frame_indicator_x_period)
	menu_frame_indicator_x = lerp(menu_frame_indicator_x_begin, menu_frame_indicator_x_target, indicator_ratio)

	menu_frame_indicator_x_time++
} else {
	menu_frame_indicator_x = menu_frame_indicator_x_target

	menu_frame_indicator_x_time = menu_frame_indicator_x_period
}
