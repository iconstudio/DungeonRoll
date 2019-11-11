/// @description editor_callback_grid_white()
/// @function editor_callback_grid_white
var background_before = background
background = editor_background.grid_white

if background_before != background {
	background_begin = background_before
	background_target = background
	grid_fade_time = 0
}
