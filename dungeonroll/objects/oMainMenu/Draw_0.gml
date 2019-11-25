/// @description 메뉴 그리기
var alpha_overall = image_alpha

draw_set_color(c_fuchsia)
draw_stack_push()
//var mouse_distance = min(point_distance(x, y, mouse_x, mouse_y), 3000)
//var mouse_direction = point_direction(x, y, mouse_x, mouse_y)
//var mouse_projection_x = lengthdir_x(mouse_distance, mouse_direction)
//var mouse_projection_y = lengthdir_y(mouse_distance, mouse_direction)

draw_set_projection(0, 0, -1600, 0, 0, 0, 0, 1, 0)
draw_primitive_begin(pr_linelist)
for (var i = 0; i < 20; ++i) {
	var point = dodecahedron_point[i]
	var ptx = point[0] * pentagon_edge_length
	var pty = point[1] * pentagon_edge_length
	var ptz = point[2] * pentagon_edge_length

	var j = i < 19 ? i + 1 : 0
	var point_next = dodecahedron_point[j]
	var ntx = point_next[0] * pentagon_edge_length
	var nty = point_next[1] * pentagon_edge_length
	var ntz = point_next[2] * pentagon_edge_length

	//draw_transform_set_rotation_x(point_direction(pty, ptz, nty, ntz))
	//draw_transform_add_rotation_y(point_direction(ptx, ptz, ntx, ntz))
	draw_transform_add_rotation_z(point_direction(ptx, pty, ntx, nty))
	draw_transform_add_translation(ptx, pty, ptz)
	//draw_line(0, 0, pentagon_edge_length, 0)
	draw_vertex(0, 0)
	
	draw_transform_set_translation(ptx, pty, ptz)
	draw_circle(0, 0, 4, false)
	draw_transform_set_identity()
}
draw_primitive_end()
/*
var dx_previous  = lengthdir_x(pentagon_radius, menu_rotation - petagon_angle)
var dy_previous  = lengthdir_y(pentagon_radius, menu_rotation - petagon_angle)
for (var i = 0; i < 5; ++i) {
	var dangle = menu_rotation + i * petagon_angle
	var dx = lengthdir_x(pentagon_radius, dangle)
	var dy = lengthdir_y(pentagon_radius, dangle)

	draw_transform_set_rotation_y(dodecahedron_dihedral_angle)
	draw_transform_add_translation(dodecahedron_under_height, 0, 0)
	draw_transform_add_rotation_z(dangle - petagon_angle * 0.5)
	draw_transform_add_translation(0, 0, 3)
	//draw_line(0, 0, dodecahedron_height, 0)
	draw_line(dodecahedron_under_height + 20, -pentagon_side_length, dodecahedron_height, 2)
	draw_line(dodecahedron_under_height + 20, pentagon_side_length, dodecahedron_height, -2)
	draw_transform_set_identity()

	draw_transform_set_rotation_y(dodecahedron_dihedral_angle)
	draw_transform_add_translation(pentagon_radius, 0, 0)
	draw_transform_add_rotation_z(dangle)
	draw_transform_add_translation(0, 0, 3)
	draw_line(0, 0, pentagon_side_length, 0)
	draw_transform_set_identity()

	draw_line(dx, dy, dx_previous, dy_previous)
	dx_previous = dx
	dy_previous = dy
}
*/
draw_stack_pop()

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
