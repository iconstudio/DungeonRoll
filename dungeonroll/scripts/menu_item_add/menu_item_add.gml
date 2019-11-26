/// @description menu_item_add(depth, caption, [callback], [variable], [alpha])
/// @function menu_item_add
/// @param depth { integer }
/// @param caption { string }
/// @param [callback] { script }
/// @param [variable] { string }
/// @param [alpha] { real }
var mdepth = argument[0]
var mcallback = argument_count > 2 ? argument[2] : noone
var mvariable = argument_count > 3 ? argument[3] : ""
var malpha = argument_count > 4 ? argument[4] : 1

menu_items[mdepth, menu_items_number[mdepth]] = [argument[1], mcallback, mvariable, malpha]
return menu_items_number[mdepth]++
