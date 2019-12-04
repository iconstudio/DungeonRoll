/// @description 메뉴 처리
if menu_mode == MODE_NONE {
	// 아직 아무것도 구현되지 않았습니다.
	
} else {
	switch menu_mode {
		case MODE_EXAMPLE:
			if menu_extension_time < menu_extension_period
				menu_extension_time++
		break

		case MODE_EXIT:
			if closing_time < closing_period
				closing_time++
			else
				game_end()
		break
	}
}

menu_rotating = false

var menu_ratio_horizontal = menu_rotate_time / menu_rotate_period
if menu_rotate_time < menu_rotate_period {
	menu_rotation_push = lerp(menu_rotation_push_begin, 0, menu_ratio_horizontal)
	menu_rotating = true

	menu_rotate_time++
} else {
	menu_rotation_push = 0

	menu_rotate_time = menu_rotate_period
}

var menu_ratio_vertical = menu_rotate_time_vertical / menu_rotate_period
if menu_rotate_time_vertical < menu_rotate_period {
	menu_rotation_vertical = lerp(menu_rotation_push_begin_vertical, menu_rotation_push_target_vertical, menu_ratio_vertical)
	menu_rotating = true

	menu_rotate_time_vertical++
} else {
	menu_rotation_vertical = menu_rotation_push_target_vertical

	menu_rotate_time_vertical = menu_rotate_period
}

if !menu_rotating {
	var key_left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_numpad4)
	var key_right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_numpad6)

	if key_left xor key_right {
		if key_left {
			menu_selection = RIGHT
		} else if key_right {
			menu_selection = LEFT
		}
	}
	
	switch menu_selection {
		case LEFT:
			var menu_data = menu_items[menu_depth, menu_selection]
			if script_exists(menu_data[1])
				script_execute(menu_data[1])

			menu_rotate_horizontal(-menu_rotate_angle)
		break

		case RIGHT:
			var menu_data = menu_items[menu_depth, menu_selection]
			if script_exists(menu_data[1])
				script_execute(menu_data[1])

			menu_rotate_horizontal(menu_rotate_angle)
		break

		default:
		break
	}
}
menu_selection = NONE

/*
var key_up = keyboard_check_pressed(vk_up)
var key_down = keyboard_check_pressed(vk_down)
if !menu_rotating and (key_up xor key_down) {
	if key_up {
		menu_rotate_vertical(-menu_rotate_angle_vertical)
	} else if key_down {
		menu_rotate_vertical(menu_rotate_angle_vertical)
	}
}
//
if menu_rotation_push_target < 0
	menu_rotation_push_target += 360
else if 360 < menu_rotation_push_target
	menu_rotation_push_target -= 360

if menu_rotation_push_target_vertical < 0
	menu_rotation_push_target_vertical += 360
else if 360 < menu_rotation_push_target_vertical
	menu_rotation_push_target_vertical -= 360

/*
if menu_draw_y_transition_time < menu_draw_y_transition_period {
	menu_draw_y_transition_time++
} else {
	menu_draw_y_transition_time = menu_draw_y_transition_period

	if menu_mode == MODE_NONE and menu_items_alpha_time[menu_depth] == menu_items_alpha_period {
		// 메뉴 모드가 MODE_NONE이고 깊이 전환도 모두 완료되었을 때만 시행합니다.

		var menu_go_up = keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_up)
		var menu_go_dw = keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_down)
		if menu_go_up xor menu_go_dw {/*
			// 상반되는 이동키를 누르지 않았을 때

			if menu_go_up {
				// 위의 메뉴 항목 선택

				if 0 < menu_item_selected[menu_depth]
					menu_item_select(menu_depth, menu_item_selected[menu_depth] - 1)
				else
					// 첫번째 항목을 선택한 상태였으므로 마지막 항목으로 이동

					menu_item_select(menu_depth, menu_items_number[menu_depth] - 1)
			} else if menu_go_dw {
				// 아래의 메뉴 항목 선택

				if menu_item_selected[menu_depth] < menu_items_number[menu_depth] - 1
					menu_item_select(menu_depth, menu_item_selected[menu_depth] + 1)
				else
					// 마지막 항목을 선택한 상태였으므로 첫번째 항목으로 이동

					menu_item_select(menu_depth, 0)
			}
		} else {
			// 이동 키를 누르지 않았을 경우 실행 조건을 확인합니다.

			if keyboard_check_pressed(vk_enter) {
				var menu_item = menu_items[menu_depth, menu_item_selected[menu_depth]]
				var menu_script = menu_item[1]

				if script_exists(menu_script)
					script_execute(menu_script, menu_item_selected[menu_depth])
			} else if keyboard_check_pressed(vk_backspace) {
				//if 0 < menu_depth
				//	menu_callback_back()
			}
		}
	}
}