/// @description editor_submenu_add(menu, caption, icon, callback)
/// @function editor_submenu_add
/// @param menu { integer }
/// @param caption { string }
/// @param icon { sprite }
/// @param callback { script }
var menu = argument0
var caption = argument1
var caption_width = string_width(caption)
var icon = argument2
var icon_width = sprite_exists(icon) ? sprite_get_width(caption) : 0
var callback = argument3
var submenu_width = menu_submenu_width_addition * 2 + caption_width + icon_width
if icon_width != 0
	submenu_width += menu_submenu_icon_width_addition

menu_submenus[menu, menu_submenu_number[menu]] = [caption // 0
, icon // 1
, callback // 2
, icon_width // 3
, submenu_width // 4
, menu_submenu_draw_width_appended + menu_submenu_width_addition] // 5

menu_submenu_draw_width_appended += submenu_width

return menu_submenu_number[menu]++
