/// @description 메뉴 처리
/*
	 menu_mode에 따라 메뉴의 작동 방식을 달리합니다.
*/
if menu_mode == MODE_NONE {
	// 아직 아무것도 구현되지 않았습니다.

	
} else {
	switch menu_mode {
		case MODE_EXAMPLE:
			image_alpha = fade_time / fade_period

			if fade_time < fade_period
				fade_time++
		break

		case MODE_EXIT:
			image_alpha = ease_in_expo(1 - fade_time / fade_period)

			if fade_time < fade_period
				fade_time++
			else
				game_end()
		break
	}
}

/*
	 깊이 전환을 처리합니다.
*/
var menu_draw_x_transition_ratio = menu_draw_x_transition_time / menu_draw_x_transition_period, menu_draw_x_transition_target
if 0 < menu_depth
	menu_draw_x_transition_target = menu_draw_x_start - menu_depth * menu_item_width_px
else
	menu_draw_x_transition_target = menu_draw_x_start

if menu_draw_x_transition_ratio < 1
	// 최적화를 위해 시간을 검사합니다.

	menu_draw_x = lerp(menu_draw_x_before, menu_draw_x_transition_target, menu_draw_x_transition_ratio)
else
	menu_draw_x = menu_draw_x_transition_target

if menu_draw_x_transition_time < menu_draw_x_transition_period
	menu_draw_x_transition_time++
else
	menu_draw_x_transition_time = menu_draw_x_transition_period

/*
	 항목 전환을 처리합니다.
*/
var menu_draw_y_transition_ratio = menu_draw_y_transition_time / menu_draw_y_transition_period
var menu_draw_y_transition_begin = menu_draw_y_start - menu_item_selected_previous[menu_depth] * menu_item_height_px
var menu_draw_y_transition_target = menu_draw_y_start - menu_item_selected[menu_depth] * menu_item_height_px
if menu_draw_y_transition_ratio < 1
	// 최적화를 위해 시간을 검사합니다.

	menu_draw_y = lerp(menu_draw_y_transition_begin, menu_draw_y_transition_target, menu_draw_y_transition_ratio)
else
	menu_draw_y = menu_draw_y_transition_target
menu_items_position_y[menu_depth] = menu_draw_y

/*
	 항목 이동 시간을 갱신하고 항목 이동을 처리합니다.
*/
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
			*/
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
