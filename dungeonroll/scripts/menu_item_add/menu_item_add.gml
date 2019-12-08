/// @description menu_item_add(index, caption, position, [callback], [visible], [available])
/// @function menu_item_add
/// @param index { integer }
/// @param caption { string }
/// @param position { array<int int> }
/// @param [callback] { script }
/// @param [visible] { boolean }
/// @param [available] { boolean }
var mdepth = argument[0]
var mcallback = argument_count > 3 ? argument[3] : -1
var mshown = argument_count > 4 ? argument[4] : true
var mavailable = argument_count > 5 ? argument[5] : true
var mposition = menu_coordinates[argument[2]]
var mitem = instance_create_layer(0, 0, layer, oMainMenuItem)
ds_list_add(menu_items[mdepth], mitem)

with mitem {
	x = lengthdir_x(mposition[0], mposition[1])
	y = lengthdir_y(mposition[0], mposition[1])
	visible = false

	index = argument[0]
	caption = argument[1]
	position = argument[2]
	shown = mshown
	callback = mcallback
	available = mavailable
	extend = false
	extend_dragging = false
	extend_time = 0

	return id
}
