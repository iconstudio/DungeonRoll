/// @description editor_callback_grid_yellow()
/// @function editor_callback_grid_yellow
var background_before = background
background = editor_background.grid_yellow

if background_before != background {
	background_begin = background_before
	background_target = background
	grid_fade_time = 0
}
