/// @description 메뉴 그리기
var alpha_overall = image_alpha
draw_set_alpha(alpha_overall)
draw_set_color(c_fuchsia)

draw_stack_push()
//var mouse_distance = min(point_distance(x, y, mouse_x, mouse_y), 3000)
//var mouse_direction = point_direction(x, y, mouse_x, mouse_y)
//var mouse_projection_x = lengthdir_x(mouse_distance, mouse_direction)
//var mouse_projection_y = lengthdir_y(mouse_distance, mouse_direction)
var projection_x = 0 //lengthdir_x(menu_perspective_distance, menu_rotation)
var projection_y = 0//lengthdir_y(menu_perspective_distance, menu_rotation)

draw_set_projection(0, 0, -1600, 0, 0, 0, 0, 1, 0)
draw_transform_add_scaling(pentagon_edge_length, pentagon_edge_length, pentagon_edge_length)
draw_transform_add_rotation_z(pentagon_tilt_angle)
draw_transform_add_rotation_y(menu_rotation_horizontal)
draw_transform_add_rotation_x(menu_rotation_vertical)

for (var i = 0; i < dodecahedron_pipeline_size; ++i) {
	var points_set = dodecahedron_pipeline[i]
	var points_number = array_length_1d(points_set)

	draw_primitive_3d_begin(pr_linestrip)
	for (var j = 0; j < points_number; ++j) {
		var point = dodecahedron_point[points_set[j]]
		draw_vertex_3d(point[0], point[1], point[2])
	}
	draw_primitive_3d_end()
}
draw_stack_pop()
draw_transform_set_identity()

/*
draw_primitive_3d_begin(pr_linestrip)
var point = dodecahedron_point[00]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[01]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[02]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[03]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[04]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[00]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[04]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[05]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[06]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[07]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[03]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[06]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[08]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[09]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[10]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[07]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[10]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[11]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[02]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[09]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[12]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[13]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[11]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[13]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[16]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[01]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[12]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[14]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[17]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[08]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[14]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[15]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[16]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[08]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[17]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[18]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[05]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[18]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[19]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[00]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()

draw_primitive_3d_begin(pr_linestrip)
point = dodecahedron_point[19]
draw_vertex_3d(point[0], point[1], point[2])
point = dodecahedron_point[15]
draw_vertex_3d(point[0], point[1], point[2])
draw_primitive_3d_end()
//*/

/*
draw_transform_add_scaling(1 / pentagon_edge_length, 1 / pentagon_edge_length, 1 / pentagon_edge_length)
draw_transform_add_rotation_y(-menu_rotation)
draw_transform_add_rotation_z(-pentagon_tilt_angle)
draw_set_font(fontPentagon)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(c_yellow)
var mv = matrix_build_lookat(800, 450, -16000, 800, 450, 0, 0, 1, 0)
var mo = matrix_build_projection_ortho(1600, 900, 1, 32000)
var mr = matrix_multiply(mv, mo)

for (var i = 0; i < 20; ++i) {
	var point = dodecahedron_point[i]
	var ptx = point[0] * pentagon_edge_length
	var pty = point[1] * pentagon_edge_length
	var ptz = point[2] * pentagon_edge_length
	draw_transform_add_translation(ptx, pty, ptz)
	draw_text(0, 0, i)
	draw_transform_add_translation(-ptx, -pty, -ptz)
}
*/

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
