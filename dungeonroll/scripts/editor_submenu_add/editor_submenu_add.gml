/// @description editor_submenu_add(menu, caption, icon, callback, [shortcut])
/// @function editor_submenu_add
/// @param menu { integer }
/// @param caption { string }
/// @param icon { sprite }
/// @param callback { script }
/// @param [shortcut] { script }
var menu = argument[0]
var caption = argument[1]
var caption_width = string_width(caption)
var icon = argument[2]
var icon_width = sprite_exists(icon) ? sprite_get_width(icon) : 0
var callback = argument[3]
var submenu_width = menu_submenu_width_addition * 2 + caption_width + icon_width
if icon_width != 0
	submenu_width += menu_submenu_icon_width_addition
var shorcut = argument_count > 5 ? argument[4] : -1

menu_submenus[menu, menu_submenu_number[menu]] = [caption // 0
, icon // 1
, callback // 2
, icon_width // 3
, submenu_width // 4
, menu_submenu_draw_width_appended + menu_submenu_width_addition // 5
, shorcut] // 6

menu_submenu_draw_width_appended += submenu_width

return menu_submenu_number[menu]++
