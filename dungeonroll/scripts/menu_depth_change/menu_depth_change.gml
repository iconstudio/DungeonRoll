/// @description menu_depth_change(depth)
/// @function menu_depth_change
/// @param depth { integer }
if menu_depth < argument0 {
	for (var i = menu_depth; i <= argument0; ++i)
		menu_items_alpha_time[i] = 0
} else if argument0 < menu_depth {
	for (var i = argument0; i <= menu_depth; ++i)
		menu_items_alpha_time[i] = 0
}
menu_depth = argument0
menu_draw_x_before = menu_draw_x
menu_draw_x_transition_time = 0
