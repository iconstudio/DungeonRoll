/// @description 어플리케이션 서피스, 커서 그리기
// 가장자리 경계 그리기
draw_set_color($b2b2b2)
draw_rectangle(view_limit[0] - 1, view_limit[1] - 1, view_limit[2] + map_width + 1, view_limit[3] + map_height + 1, true)

gpu_set_blendenable(false)
shader_set(shaderFXAA)
global.application_texture = surface_get_texture(application_surface)
var texel_width = texture_get_texel_width(global.application_texture)
var texel_height = texture_get_texel_height(global.application_texture)
shader_set_uniform_f(global.shaderFXAA_texel, texel_width, texel_height)
shader_set_uniform_f(global.shaderFXAA_strength, 10) // 0 ~ 10
draw_surface_part_ext(application_surface, 0, 0, map_real_width, map_real_height, floor(map_x), floor(map_y), map_scale, map_scale, $ffffff, 1)
shader_reset()
gpu_set_blendenable(true)

if cursor_state == editor_cursor_state.normal and cursor_editor_innered {
	var cursor_node_x_adjusted = cursor_node_x - map_x, cursor_node_y_adjusted = cursor_node_y - map_y

	switch menu_mode {
		case editor_menu.tile:
		case editor_menu.doodad:
			if sidepanel_cursor != -1
				draw_sprite_ext(sidepanel_cursor, sidepanel_cursor_index, cursor_node_x_adjusted, cursor_node_y_adjusted, 1, 1, 0, $ffffff, 0.7)
		break

		case editor_menu.entity:
			if sidepanel_cursor != -1
				draw_sprite_ext(sidepanel_cursor, 0, cursor_node_x_adjusted + 8, cursor_node_y_adjusted + 8, 1, 1, 0, $ffffff, 0.7)
		break;

		case editor_menu.node_modify:
			draw_set_alpha(0.8)
			draw_set_color($ff)
			draw_circle(cursor_node_x_adjusted + 8, cursor_node_y_adjusted + 8, 4, false)

			draw_set_alpha(1)
			if !view_mover_dragging and node_modify_link_add and instance_exists(node_selected)
				draw_line(node_selected.x - map_x + 8, node_selected.y - map_y + 8, cursor_node_x_adjusted + 8, cursor_node_y_adjusted + 8)
		break

		default:
			// 아무것도 하지 않음
		break;
	}
}

//shader_set(shaderBlur)
//shader_set_uniform_f(global.shaderBlur_texel_size, texture_get_texel_width(global.application_texture), texture_get_texel_height(global.application_texture))
//draw_surface_part_ext(application_surface, 0, 0, map_real_width * 0.5, map_real_height, floor(map_x), floor(map_y), map_scale, map_scale, $ffffff, 1)
//shader_reset()
