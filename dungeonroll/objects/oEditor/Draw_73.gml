/// @description 노드 커서 그리기
if cursor_state == editor_cursor_state.normal and cursor_editor_innered {
	switch menu_mode {
		case editor_menu.tile:
		case editor_menu.doodad:
			if sidepanel_cursor != -1
				draw_sprite_ext(sidepanel_cursor, sidepanel_cursor_index, cursor_node_x, cursor_node_y, 1, 1, 0, $ffffff, 0.7)
		break

		case editor_menu.entity:
			if sidepanel_cursor != -1
				draw_sprite_ext(sidepanel_cursor, 0, cursor_node_x + 8, cursor_node_y + 8, 1, 1, 0, $ffffff, 0.7)
		break;

		case editor_menu.node_modify:
			draw_set_alpha(0.8)
			draw_set_color($ff)
			draw_circle(cursor_node_x + 8, cursor_node_y + 8, 4, false)

			draw_set_alpha(1)
			if !view_mover_dragging and node_modify_link_add and instance_exists(node_selected)
				draw_line(node_selected.x + 8, node_selected.y + 8, cursor_node_x + 8, cursor_node_y + 8)
		break

		default:
			// 아무것도 하지 않음
		break;
	}
}
