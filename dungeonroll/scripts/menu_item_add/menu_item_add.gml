/// @description menu_item_add(index, caption, position, [callback], [available])
/// @function menu_item_add
/// @param index { integer }
/// @param caption { string }
/// @param position { array<int, int> }
/// @param [callback] { script }
/// @param [available] { boolean }
var mdepth = argument[0]
var mcallback = argument_count > 3 ? argument[3] : -1
var mavailable = argument_count > 4 ? argument[4] : true

menu_items[mdepth, menu_items_number[mdepth]] = [argument[1], menu_coordinates[argument[2]], argument[2], mcallback, mavailable]
return menu_items_number[mdepth]++
