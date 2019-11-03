/// @description 노드 커서 그리기
if cursor_state == editor_cursor_state.normal {
	if menu_mode == editor_menu.node_modify and point_in_rectangle_fixed(cursor_x, cursor_y, 0, 0, map_real_width, map_real_height) {
		draw_set_alpha(0.8)
		draw_set_color($ff)
		draw_circle(cursor_node_x + 8, cursor_node_y + 8, 4, false)

		draw_set_alpha(1)
		if !view_mover_dragging and node_modify_link_add and instance_exists(node_selected)
			draw_line(node_selected.x + 8, node_selected.y + 8, cursor_node_x + 8, cursor_node_y + 8)
	}
}
