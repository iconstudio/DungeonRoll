/// @description 노드 커서 그리기
if cursor_state != editor_cursor_state.on_ui {
	if menu_mode == editor_tool.node_add
		draw_sprite_ext(sNode, 0, cursor_node_x, cursor_node_y, 1, 1, 0, $ffffff, 0.4)
}
