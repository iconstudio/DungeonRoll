/// @description 주 메뉴 그리기
draw_stack_push()
var project_origin = draw_set_projection(0, 0, -16000, 0, 0, 0, 0, 1, 0)
draw_transform_set_translation(800 - menu_scroll, 450, 0)

draw_set_halign(1)
draw_set_valign(1)
for (var i = 0; i < menu_number; ++i) {
	var submenu_number = menu_items_number[i]
	if 0 < submenu_number {
		for (var j = 0; j < submenu_number; ++j) {
			var menu_info = menu_items[i, j]
			var menu_position = menu_info[1]
			var menu_dx = lengthdir_x(menu_position[0], menu_position[1])
			var menu_dy = lengthdir_y(menu_position[0], menu_position[1])
			draw_sprite(sMenuPanel, 0, menu_dx, menu_dy)
			draw_text(menu_dx, menu_dy, menu_info[0])
		}
	}

	draw_transform_add_translation(menu_item_gap, 0, 0)
}

draw_transform_set_identity()
draw_stack_pop()
camera_set_view_mat(project_origin[0], project_origin[1])
camera_apply(project_origin[0])
