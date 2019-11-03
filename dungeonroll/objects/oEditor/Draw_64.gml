/// @description 도구 그리기
draw_set_alpha(1)

// 보조 메뉴 그리기
draw_set_font(fontEditor)
draw_set_halign(1)
draw_set_valign(1)
if menu_frame_submenu_show {
	draw_set_color(menu_frame_color)
	//editor_draw_blured(0, menu_item_frame_height, 0, menu_item_frame_height, width, menu_frame_height - menu_item_frame_height)
	draw_rectangle(0, menu_item_frame_height, width, menu_frame_height, false)

	// 보조 메뉴 강조 사각형 그리기
	if 0 < menu_submenu_indicator_frame_alpha {
		draw_set_alpha(menu_submenu_indicator_frame_alpha)
		draw_set_color($ffffff)
		draw_rectangle(menu_submenu_indicator_frame_left, menu_submenu_y, menu_submenu_indicator_frame_right, menu_frame_height, false)
		draw_set_alpha(1)
	}

	draw_set_color(0)
	for (var j = 0; j < menu_submenu_number[menu_mode]; ++j) {
		var submenu_data = menu_submenus[menu_mode, j]
		var submenu_content_draw_x = submenu_data[5]

		if sprite_exists(submenu_data[1]) {
			draw_sprite(submenu_data[1], 0, submenu_content_draw_x, menu_frame_height - menu_submenu_icon_y)
			submenu_content_draw_x += submenu_data[3] + menu_submenu_icon_width_addition
		}
		if submenu_data[0] != "" {
			draw_set_halign(0)
			draw_text(submenu_content_draw_x, menu_frame_height - menu_submenu_caption_y, submenu_data[0])
			draw_set_halign(1)
		}
	}
}

// 주 메뉴 틀 그리기
draw_set_color(menu_frame_color)
draw_rectangle(0, 0, width, menu_item_frame_height, false)

// 주 메뉴 강조 사각형 그리기
draw_set_alpha(menu_frame_indicator_frame_alpha)
draw_set_color($ffffff)
draw_rectangle(menu_frame_indicator_frame_left, 0, menu_frame_indicator_frame_right, menu_frame_indicator_y, false)
draw_set_alpha(1)

// 주 메뉴 표시기 그리기
var indicator_left = menu_frame_indicator_x - menu_frame_indicator_width_half_actual
var indicator_right = menu_frame_indicator_x + menu_frame_indicator_width_half_actual
draw_set_color(menu_frame_indicator_color)
draw_rectangle(indicator_left, menu_frame_indicator_y, indicator_right, menu_frame_indicator_y + menu_frame_indicator_height, false)

// 주 메뉴 그리기
draw_set_color(0)
draw_set_halign(1)
for (var i = 0; i < menu_number; ++i) {
	var menu_data = menu_items[i]
	var is_selected = (i == menu_mode)

	if is_selected
		draw_set_font(fontEditorMenu)
	draw_text(menu_data[5], menu_frame_caption_y, menu_data[0])
	if is_selected
		draw_set_font(fontEditor)
}

// 주 메뉴 설명 그리기
draw_set_color($ffffff)
draw_set_halign(2)
draw_set_valign(2)
draw_text(floor(width - 16), floor(height - 16), menu_mode_description)

// 좌표 표기하기
draw_set_halign(0)
draw_text(floor(16), floor(height - 16), "(" + string(floor(cursor_x * map_scale_reverse)) + ", " + string(floor(cursor_y * map_scale_reverse)) + ")")

// 개체 선택 틀 그리기
if sidepanel_opened {
	var draw_items_ok = is_array(sidepanel_items)

	draw_set_alpha(0.8)
	draw_set_color(menu_frame_color)
	draw_rectangle(sidepanel_x, sidepanel_y, sidepanel_x + sidepanel_width, sidepanel_y + sidepanel_height, false)

	draw_set_alpha(1)
	draw_set_color(0)
	for (var i = 0; i < sidepanel_item_count; ++i) {
		var item_positions = sidepanel_items_positions[i]
		var item_draw_x = sidepanel_item_x_begin + item_positions[0]
		var item_draw_y = sidepanel_item_y_begin + item_positions[1]

		draw_rectangle(item_draw_x, item_draw_y, item_draw_x + sidepanel_item_size, item_draw_y + sidepanel_item_size, false)

		if draw_items_ok {
			var draw_item_focused = false, draw_item = -1, draw_item_sprite = -1, draw_item_index = 0, draw_item_x, draw_item_y
			switch menu_mode {
				case editor_menu.brush: // 타일 목록 그리기
					draw_item = sidepanel_tiles[i]
					draw_item_sprite = draw_item[0]
					draw_item_index = draw_item[1]
					draw_item_x = item_draw_x
					draw_item_y = item_draw_y
					draw_item_focused = i == sidepanel_tile_index
				break

				case editor_menu.doodad: // 장식물 목록 그리기
					draw_item = sidepanel_doodads[i]
					draw_item_sprite = draw_item[0]
					draw_item_index = 0
					draw_item_x = item_draw_x + sidepanel_item_size * 0.5
					draw_item_y = item_draw_y + sidepanel_item_size * 0.5
					draw_item_focused = i == sidepanel_doodad_index
				break

				case editor_menu.instance: // 개체 목록 그리기
					draw_item = sidepanel_objects[i]
					draw_item_sprite = draw_item[0]
					draw_item_index = 0
					draw_item_x = item_draw_x + sidepanel_item_size * 0.5
					draw_item_y = item_draw_y + sidepanel_item_size * 0.5
					draw_item_focused = i == sidepanel_object_index
				break
			}

			if draw_item_sprite != -1
				draw_sprite_stretched(draw_item_sprite, draw_item_index, draw_item_x, draw_item_y, sidepanel_item_size + 1, sidepanel_item_size + 1)

			if draw_item_focused {
				draw_set_color($ff)
				draw_rectangle(item_draw_x, item_draw_y, item_draw_x + sidepanel_item_size, item_draw_y + sidepanel_item_size, true)
				draw_rectangle(item_draw_x + 1, item_draw_y + 1, item_draw_x + sidepanel_item_size - 1, item_draw_y + sidepanel_item_size - 1, true)
				draw_set_color(0)
			}
		}
	}
}
