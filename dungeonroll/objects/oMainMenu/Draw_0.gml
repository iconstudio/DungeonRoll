/// @description 메뉴 그리기
var alpha_overall = image_alpha
draw_set_alpha(alpha_overall)
draw_set_color(c_fuchsia)

draw_stack_push()
//var mouse_distance = min(point_distance(x, y, mouse_x, mouse_y), 3000)
//var mouse_direction = point_direction(x, y, mouse_x, mouse_y)
//var mouse_projection_x = lengthdir_x(mouse_distance, mouse_direction)
//var mouse_projection_y = lengthdir_y(mouse_distance, mouse_direction)

var project_origin = draw_set_projection(0, 0, menu_perspective_distance, 0, 0, 0, 0, 1, 0)

draw_set_color($ffffff)
draw_set_font(fontMenu)
draw_set_halign(1)
draw_set_valign(1)

var menu_render_angle = menu_rotation + menu_rotation_push
for (var i = 0; i <= menu_depth_max; ++i) {
	draw_transform_set_rotation_x(90)
	draw_transform_add_translation(0, menu_edge_length, 0)
	draw_transform_add_rotation_z(menu_render_angle)
	draw_transform_add_rotation_x(-90)
	draw_transform_add_rotation_y(-menu_render_angle)

	var menu_info = menu_items[i, 0]
	var menu_coords = menu_position[0]
	var menu_dx = lengthdir_x(menu_coords[0], menu_coords[1])
	var menu_dy = lengthdir_y(menu_coords[0], menu_coords[1])
	draw_stack_push()
	draw_transform_add_translation(menu_dx, menu_dy, 0)
	draw_text(0, 0, menu_info[0])
	draw_stack_pop()

	menu_info = menu_items[i, 1]
	menu_coords = menu_position[1]
	menu_dx = lengthdir_x(menu_coords[0], menu_coords[1])
	menu_dy = lengthdir_y(menu_coords[0], menu_coords[1])
	draw_stack_push()
	draw_transform_add_translation(menu_dx, menu_dy, 0)
	draw_text(0, 0, menu_info[0])
	draw_stack_pop()

	menu_info = menu_items[i, 2]
	menu_coords = menu_position[2]
	menu_dx = lengthdir_x(menu_coords[0], menu_coords[1])
	menu_dy = lengthdir_y(menu_coords[0], menu_coords[1])
	draw_stack_push()
	draw_transform_add_translation(menu_dx, menu_dy, 0)
	draw_text(0, 0, menu_info[0])
	draw_stack_pop()

	menu_info = menu_items[i, 3]
	menu_coords = menu_position[3]
	menu_dx = lengthdir_x(menu_coords[0], menu_coords[1])
	menu_dy = lengthdir_y(menu_coords[0], menu_coords[1])
	draw_stack_push()
	draw_transform_add_translation(menu_dx, menu_dy, 0)
	draw_text(0, 0, menu_info[0])
	draw_stack_pop()

	draw_transform_set_identity()

	if menu_item_sign == LEFT
		menu_render_angle -= menu_rotate_angle
	else if menu_item_sign == RIGHT
		menu_render_angle += menu_rotate_angle
}

draw_stack_pop()
camera_set_view_mat(project_origin[0], project_origin[1])
camera_apply(project_origin[0])
