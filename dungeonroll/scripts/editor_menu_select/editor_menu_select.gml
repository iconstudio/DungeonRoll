/// @description editor_menu_select(new_menu)
/// @function editor_menu_add
/// @param new_menu { integer }
if argument0 != menu_mode {
	var menu_data = menu_items[argument0]
	menu_frame_indicator_width_half_begin = menu_data[1] * 0.5
	menu_frame_indicator_width_half_target = menu_data[4] * 0.5
	
	menu_frame_indicator_x_begin = menu_frame_indicator_x
	menu_frame_indicator_x_target = menu_data[5]
	menu_frame_indicator_x_time = 0

	menu_mode_description = menu_data[2]

	menu_submenu_indicator_frame_time = 0
}

menu_mode_previous = menu_mode
menu_mode = argument0
menu_option = 0
