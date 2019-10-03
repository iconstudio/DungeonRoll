/// @description editor_menu_select(new_menu)
/// @function editor_menu_add
/// @param new_menu { integer }
if argument0 != menu_mode {
	var menu_item = menu_items[argument0]
	menu_frame_indicator_x_begin = menu_frame_indicator_x
	menu_frame_indicator_x_target = menu_item[5]
	menu_frame_indicator_x_time = 0
}

menu_mode_previous = menu_mode
menu_mode = argument0
