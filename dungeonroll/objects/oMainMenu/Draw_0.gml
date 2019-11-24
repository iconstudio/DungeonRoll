/// @description 메뉴 그리기
var alpha_overall = image_alpha

/*
var menu_item_alpha, menu_items_alpha_ratio, menu_item_string, menu_item = ["", noone, 1]
var menu_dx = menu_draw_x, menu_dy

draw_set_alpha(alpha_overall * 0.3)
for (var j = 0; j <= menu_depth_max; ++j) {
	// 첫 반복문은 깊이부터 시작합니다. 깊이는 가로로 나열합니다.

	menu_dy = menu_items_position_y[j]
	for (var i = 0; i < menu_items_number[j]; ++i) {
		// 항목은 세로로 나열합니다.
		
		menu_item = menu_items[j, i]
		menu_item_alpha = alpha_overall * menu_items_alpha[j] * menu_item[3]
		draw_set_alpha(menu_item_alpha)

		menu_item_string = menu_item[0]
		if menu_depth <= j and menu_item[2] != "" {
			// 만약 지금 그리는 항목의 깊이가 현재 깊이보다 크거나 같아야 보조 변수를 표시합니다.

			if variable_global_exists(menu_item[2])
				menu_item_string += ": " + string(variable_global_get(menu_item[2]))
		}
		
		//draw_set_font(i == menu_item_selected[j] ? fontMainMenuBold : fontMainMenu)
		draw_text(menu_dx, menu_dy, menu_item_string)

		menu_dy += menu_item_height_px
	}
	// 좌표를 초기화합니다.
	menu_dy = menu_items_position_y[j]
	menu_dx += menu_item_width_px

	/*
		 지금 그리려는 깊이의 투명도를 조절합니다.
	*/
	menu_items_alpha_ratio = menu_items_alpha_time[j] / menu_items_alpha_period
	if j == menu_depth {
		// 현재 깊이 & 새 깊이로 내려가기: 0 -> 1 페이드 인

		if menu_items_alpha[j] != 1
			menu_items_alpha[j] = lerp(menu_items_alpha[j], 1, menu_items_alpha_ratio)
	} else if menu_depth < j {
		// 이전 깊이로 돌아가기: 1 -> 0 페이드 아웃

		menu_items_alpha[j] = 1 - menu_items_alpha_ratio
	} else {
		// 이전 깊이: 1 -> 0.5 페이드

		menu_items_alpha[j] = 1 - menu_items_alpha_ratio * 0.5
	}

	if menu_items_alpha_time[j] < menu_items_alpha_period
		menu_items_alpha_time[j]++
	else
		menu_items_alpha_time[j] = menu_items_alpha_period
}
