/// @description editor_menu_add(caption, description, callback)
/// @function editor_menu_add
/// @param caption { string }
/// @param description { string }
/// @param callback { script }
var caption = argument0
var caption_width = string_width(caption)
var description = argument1
var callback = argument2

var menu_draw_width_one = menu_frame_width_addition * 2 + caption_width
menu_items[menu_number] = [caption // 0
, caption_width, // 1
description // 2
, callback // 3
, menu_draw_width_one // 4, menu_item_width
, menu_frame_draw_width_appended + menu_draw_width_one * 0.5] // 5, menu_draw_x
menu_submenu_number[menu_number] = 0
menu_submenus[menu_number] = []

menu_frame_draw_width_appended += menu_draw_width_one

return menu_number++
