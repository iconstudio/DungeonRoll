/// @description 주 메뉴 그리기
draw_set_alpha(image_alpha)

//draw_stack_push()
//var project_origin = draw_set_projection(0, 0, menu_perspective_distance, 0, 0, 0, 0, 1, 0)
//draw_transform_set_translation(800 - menu_scroll, 450, 0)

// 메뉴 항목 그리기
draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)
for (var i = 0; i < menu_number; ++i) {
	var submenu_number = menu_items_number[i]
	if 0 < submenu_number {
		for (var j = 0; j < submenu_number; ++j) {
			var menu_info = menu_items[i, j]
			var menu_position = menu_info[1]
			var menu_dx = lengthdir_x(menu_position[0], menu_position[1]) + 800 - menu_scroll + i * menu_item_gap
			if menu_dx + menu_item_size_half <= 0 or 1600 < menu_dx - menu_item_size_half
				continue

			var menu_alpha = 0
			if menu_pushing { // 방향키
				var push_ratio = menu_push_time / menu_push_period
				if i == menu_index_previous
					menu_alpha = 1 - push_ratio
				else if i == menu_index
					menu_alpha = push_ratio
			} else if menu_dragging { // 터치
				
			} else {
				if i == menu_index or (800 - menu_item_gap <= menu_dx or menu_dx < 800 + menu_item_gap) {
						menu_alpha = 1
				}
			}

			draw_set_alpha(image_alpha * menu_alpha)
			var menu_dy = lengthdir_y(menu_position[0], menu_position[1]) + 450
			draw_sprite(sMenuPanel, 0, menu_dx, menu_dy)
			draw_text(menu_dx, menu_dy, menu_info[0])
		}
	}

	//draw_transform_add_translation(menu_item_gap, 0, 0)
}
draw_set_alpha(image_alpha)

//draw_transform_set_identity()
//draw_stack_pop()
//camera_set_view_mat(project_origin[0], project_origin[1])
//camera_apply(project_origin[0])

// 좌우 음영 그리기
draw_set_color(0)
gpu_set_blendmode(bm_subtract)
draw_rectangle_color(0, 0, menu_shade_size, 900, $ffffff, 0, 0, $ffffff, false)
draw_rectangle_color(1600 - menu_shade_size, 0, 1600, 900, 0,  $ffffff,  $ffffff, 0, false)
gpu_set_blendmode(bm_normal)
