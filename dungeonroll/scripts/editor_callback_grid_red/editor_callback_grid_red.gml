/// @description editor_callback_grid_red()
/// @function editor_callback_grid_red
var background_before = background
background = editor_background.grid_red

if background_before != background {
	background_begin = background_before
	background_target = background
	grid_fade_time = 0
}
