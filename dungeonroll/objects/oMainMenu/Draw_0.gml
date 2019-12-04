/// @description 주 메뉴 그리기
draw_stack_push()
var project_origin = draw_set_projection(0, 0, -16000, 0, 0, 0, 0, 1, 0)

for (var i = 0; i < menu_number; ++i) {
	
	draw_transform_add_translation(menu_item_gap, 0, 0)
}

draw_transform_set_identity()
draw_stack_pop()
camera_set_view_mat(project_origin[0], project_origin[1])
camera_apply(project_origin[0])
