/// @description 배경 그리기
var color_background = $80
switch background {
	case editor_background.black:
		// 아무것도 그리지 않음.
		exit

	case editor_background.grid_inverse:
		gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color)
		for (var i = 0; i < nodes_size_w; ++i) {
			for (var j = 0; j < nodes_size_h; ++j)
				draw_sprite_ext(sEditorGrid, 0, i * 16, j * 16, 1, 1, 0, $ffffff, 1)
		}
		gpu_set_blendmode(bm_normal)
	exit

	case editor_background.grid_yellow:
		color_background = $00ffff
	break

	case editor_background.grid_white:
		color_background = $ffffff
	break

	case editor_background.grid_red:
		color_background = $80
	break

	default:
		break
}

for (var i = 0; i < nodes_size_w; ++i) {
	for (var j = 0; j < nodes_size_h; ++j)
		draw_sprite_ext(sEditorGrid, 0, i * 16, j * 16, 1, 1, 0, color_background, 0.9)
}
