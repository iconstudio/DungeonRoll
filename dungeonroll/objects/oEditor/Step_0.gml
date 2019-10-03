/// @description 입력 및 갱신
cursor_x = device_mouse_x(0)
cursor_y = device_mouse_y(0)
cursor_gui_x = device_mouse_x_to_gui(0)
cursor_gui_y = device_mouse_y_to_gui(0)

menu_frame_indicator_on = -1
if cursor_gui_x < 0 or cursor_gui_y < 0 or global.resolutions_gui[0] < cursor_gui_x or global.resolutions_gui[1] < cursor_gui_y {
	cursor_state = editor_cursor_state.on_outside
} else if !view_mover_dragging and 0 <= cursor_gui_y and cursor_gui_y < menu_frame_height {
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
				menu_frame_indicator_frame_left = frame_left
				menu_frame_indicator_frame_right = frame_right
				
				// 메뉴 설명 바꾸기
				menu_mode_description = menu_data[2]

				// 새로운 메뉴 가리키기
				if menu_frame_indicator_frame_previous != i {
					menu_frame_indicator_frame_time = 0

					menu_frame_indicator_frame_previous = i
				}

				if i == menu_mode {
					menu_frame_indicator_on = i

					if menu_frame_indicator_time < menu_frame_indicator_period
						menu_frame_indicator_time++
					else
						menu_frame_indicator_time = menu_frame_indicator_period
				}

				if menu_frame_indicator_frame_time < menu_frame_indicator_frame_period
					menu_frame_indicator_frame_time++
				else
					menu_frame_indicator_frame_time = menu_frame_indicator_frame_period

				if device_mouse_check_button_pressed(0, mb_left)
					editor_menu_select(i)
			}
		}
	}

	window_set_cursor(cr_default)
} else {
	cursor_state = editor_cursor_state.normal

	if !view_mover_dragging {
		if menu_mode == editor_menu.node_add {
			cursor_node_x = mouse_x div 16 * 16
			cursor_node_y = mouse_y div 16 * 16
		}

		if menu_mode == editor_menu.cursor
			window_set_cursor(cr_default)
		else if menu_mode == editor_menu.node_add
			window_set_cursor(cr_none)
		else if menu_mode == editor_menu.node_delete
			window_set_cursor(cr_cross)
		else
			window_set_cursor(cr_handpoint)
	} else {
		window_set_cursor(cr_drag)
	}
}

var indicator_ratio = menu_frame_indicator_time / menu_frame_indicator_period
var indicator_frame_ratio = menu_frame_indicator_frame_time / menu_frame_indicator_frame_period

if menu_frame_indicator_width_half_actual != menu_frame_indicator_width_half
	menu_frame_indicator_width_half_actual += (menu_frame_indicator_width_half - menu_frame_indicator_width_half_actual) * 0.2
menu_frame_indicator_width_half = lerp(menu_frame_indicator_width_half_begin, menu_frame_indicator_width_half_target, indicator_ratio)
menu_frame_indicator_frame_alpha = indicator_frame_ratio

// 인터페이스 상주 중이 아니면 강조 해제
if menu_frame_indicator_y <= cursor_gui_y or cursor_state != editor_cursor_state.on_ui {
	if menu_frame_indicator_x == menu_frame_indicator_x_target {
		if 0 < menu_frame_indicator_time
			menu_frame_indicator_time--
		else
			menu_frame_indicator_time = 0

		if 0 < menu_frame_indicator_frame_time
			menu_frame_indicator_frame_time--
		else
			menu_frame_indicator_frame_time = 0
	}

	// 메뉴 설명 원래대로 돌리기
	var menu_data = menu_items[menu_mode]
	menu_mode_description = menu_data[2]
} else {
	if menu_frame_indicator_on == -1 {
		if 0 < menu_frame_indicator_time
			menu_frame_indicator_time--
		else
			menu_frame_indicator_time = 0
	}
}

// 숫자 키로 메뉴 항목 선택
if !view_mover_dragging {
	for (var i = editor_menu.cursor; i <= editor_menu.doodad; ++i) {
		if keyboard_check_pressed(49 + i) {
			// 마우스가 가리키는 항목의 설명을 우선한다.
			var description_previous = menu_mode_description
			editor_menu_select(i)
			menu_mode_description = description_previous
		}
	}
}

// 사각형 강조 표시의 시간 증가
if menu_frame_indicator_x_time < menu_frame_indicator_x_period {
	var indicator_ratio = ease_out_quartic(menu_frame_indicator_x_time / menu_frame_indicator_x_period)
	menu_frame_indicator_x = lerp(menu_frame_indicator_x_begin, menu_frame_indicator_x_target, indicator_ratio)

	menu_frame_indicator_x_time++
} else {
	menu_frame_indicator_x = menu_frame_indicator_x_target

	menu_frame_indicator_x_time = menu_frame_indicator_x_period
}

// 시점 이동
if view_mover_dragging and device_mouse_check_button(0, mb_middle) {
	if view_mover_x_begin != -1 and view_mover_y_begin != -1 {
		camera_set_view_pos(view_camera
		, view_pos_x_begin - (cursor_x - view_mover_x_begin)
		, view_pos_y_begin - (cursor_y - view_mover_y_begin))
	}
}

// 휠로 시점 이동 시작
if cursor_state == editor_cursor_state.normal and !view_mover_dragging and device_mouse_check_button_pressed(0, mb_middle) {
	view_mover_dragging = true

	view_pos_x_begin = camera_get_view_x(view_camera)
	view_pos_y_begin = camera_get_view_y(view_camera)
	view_mover_x_begin = cursor_x
	view_mover_y_begin = cursor_y
}

if device_mouse_check_button_released(0, mb_middle) {
	view_mover_dragging = false

	view_mover_x_begin = -1
	view_mover_y_begin = -1
}
