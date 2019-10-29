/// @description 노드 커서, 격자 그리기
var color_background = $ff
switch background {
	case editor_background.grid_inverse:
		gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color)
		for (var i = 0; i < nodes_size_w; ++i) {
			for (var j = 0; j < nodes_size_h; ++j)
				draw_sprite_ext(sEditorGrid, 0, i * 16, j * 16, 1, 1, 0, $ffffff, 0.5)
		}
		gpu_set_blendmode(bm_normal)
	break

	case editor_background.grid_white:
		color_background += $ffff00
	case editor_background.grid_yellow:
		color_background += $0080
	case editor_background.grid_red:
		for (var i = 0; i < nodes_size_w; ++i) {
			for (var j = 0; j < nodes_size_h; ++j)
				draw_sprite_ext(sEditorGrid, 0, i * 16, j * 16, 1, 1, 0, color_background, 0.5)
		}
	break

	default:
		break
}

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
