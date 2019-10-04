/// @description 노드 커서 그리기
if cursor_state != editor_cursor_state.on_ui {
	if menu_mode == editor_menu.node_modify {
		draw_set_alpha(0.4)
		draw_set_color($ff)
		draw_circle(cursor_node_x + 8, cursor_node_y + 8, 4, false)

		if !view_mover_dragging and node_modify_link_add and instance_exists(node_selected) {
			draw_line(node_selected.x + 8, node_selected.y + 8, cursor_node_x + 8, cursor_node_y + 8)
		}

		draw_set_alpha(1)
	}
}
