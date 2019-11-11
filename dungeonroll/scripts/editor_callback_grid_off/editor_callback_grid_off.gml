/// @description editor_callback_grid_off()
/// @function editor_callback_grid_off
var background_before = background
background = editor_background.black

if background_before != background {
	background_begin = background_before
	background_target = background
	grid_fade_time = 0
}
