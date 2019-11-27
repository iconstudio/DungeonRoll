/// @description menu_item_add(depth, caption, [callback], [available])
/// @function menu_item_add
/// @param depth { integer }
/// @param caption { string }
/// @param [callback] { script }
/// @param [available] { boolean }
var mdepth = argument[0]
var mcallback = argument_count > 2 ? argument[2] : -1
var mavailable = argument_count > 3 ? argument[3] : ""

menu_items[mdepth, menu_items_number[mdepth]] = [argument[1], mcallback, mavailable]
return menu_items_number[mdepth]++
