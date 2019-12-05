/// @description 메뉴 갱신
var key_left = keyboard_check(vk_left)
var key_right = keyboard_check(vk_right)
var key_left_pressed = keyboard_check_pressed(vk_left)
var key_right_pressed = keyboard_check_pressed(vk_right)

if menu_pushing {
	menu_scroll = lerp(menu_scroll_begin, menu_scroll_target, script_execute(menu_scroll_easer, menu_push_time / menu_push_period))

	if menu_push_time < menu_push_period {
		menu_push_time++
	} else {
		menu_pushing = false

		menu_push_time = menu_push_period
	}
} else {
	if !menu_dragging {
		if (key_left_pressed xor key_right_pressed) and (key_left_pressed or key_right_pressed) {
			var push = false
			if key_left_pressed {
				if 0 < menu_index {
					menu_select(menu_index - 1)
					push = true
				} else {
					
				}
			} else if key_right_pressed {
				if menu_index < menu_number - 1 {
					menu_select(menu_index + 1)
					push = true
				} else {
					
				}
			}

			if push {
				menu_scroll_begin = menu_scroll
				menu_scroll_target = menu_index * menu_item_gap
				menu_pushing = true
				menu_push_time = 0
			}
		}
	}
}
