/// @description editor_get_surface()
/// @function editor_get_surface
if !surface_exists(global.editor_surface)
 global.editor_surface = surface_create(global.resolutions_gui[0], global.resolutions_gui[1])
global.application_texture = surface_get_texture(application_surface)

return global.editor_surface
