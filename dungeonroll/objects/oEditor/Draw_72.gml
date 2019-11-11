/// @description 배경 그리기
var grid_ratio = grid_fade_time / grid_fade_period
if grid_fade_time < grid_fade_period
	grid_fade_time++
else
	grid_fade_time = grid_fade_period

var is_black = (background == editor_background.black)
if is_black and 1 <= grid_ratio
	exit // 아무것도 그리지 않음

if grid_ratio < 1 {
	var grid_color_before = global.editor_grid_color_info[background_begin]
	var grid_color_next = global.editor_grid_color_info[background_target]
	var grid_hue = is_black ? grid_color_before[0] : lerp(grid_color_before[0], grid_color_next[0], grid_ratio)
	var grid_sat = is_black ? grid_color_before[1] : lerp(grid_color_before[1], grid_color_next[1], grid_ratio)
	var grid_val = lerp(grid_color_before[2], grid_color_next[2], grid_ratio)
	grid_color = make_color_hsv(grid_hue, grid_sat, grid_val)
} else {
	grid_color = global.editor_grid_color[background_target]
}

//if background == editor_background.grid_inverse
//	gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color)
for (var i = 0; i < nodes_size_w; ++i) {
	for (var j = 0; j < nodes_size_h; ++j)
		draw_sprite_ext(sEditorGrid, 0, i * 16, j * 16, 1, 1, 0, grid_color, 0.9)
}
//if background == editor_background.grid_inverse
//	gpu_set_blendmode(bm_normal)
