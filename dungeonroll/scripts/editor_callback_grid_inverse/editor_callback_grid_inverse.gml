/// @description editor_callback_grid_inverse()
/// @function editor_callback_grid_inverse
var background_before = background
background = editor_background.grid_inverse

if background_before != background {
	background_begin = background_before
	background_target = background
	grid_fade_time = 0
}
