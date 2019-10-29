/// @description editor_draw_blured(x, y, left, top, width, height)
/// @param x
/// @param y
/// @param left
/// @param top
/// @param width
/// @param height
//var surface_original = surface_get_target()
//surface_reset_target()
surface_set_target(editor_get_surface())
shader_set(shaderBlur)
shader_set_uniform_f(global.shaderBlur_texel_size, texture_get_texel_width(global.application_texture), 0)
gpu_set_blendenable(false)
draw_surface_part_ext(application_surface, argument2, argument3, argument4, argument5, argument0, argument1, 1, 1, $ffffff, 1)
gpu_set_blendenable(true)
shader_reset()
surface_reset_target()

//surface_set_target(surface_original)
shader_set(shaderBlur)
shader_set_uniform_f(global.shaderBlur_texel_size, 0, texture_get_texel_height(global.application_texture))
draw_surface_part_ext(editor_get_surface(), argument2, argument3, argument4, argument5, argument0, argument1, 1, 1, $ffffff, draw_get_alpha())
shader_reset()
