/// @description menu_item_clear(depth, [select])
/// @function menu_item_clear
/// @param depth { integer }
/// @param [select] { integer }
var mdepth = argument[0]
var mselect = argument_count > 1 ? argument[1] : 0
if menu_depth_max < mdepth
	menu_depth_max = mdepth

menu_items_number[mdepth] = 0
menu_items[mdepth, 0] = []
menu_items_position[mdepth] = 0

menu_item_selected[mdepth] = mselect
menu_item_selected_previous[mdepth] = mselect
