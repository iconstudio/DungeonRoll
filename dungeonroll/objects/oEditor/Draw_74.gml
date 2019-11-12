/// @description 어플리케이션 서피스 그리기
// 가장자리 경계 그리기
draw_set_color($b2b2b2)
draw_rectangle(view_limit[0] - 1, view_limit[1] - 1, view_limit[2] + map_width + 1, view_limit[3] + map_height + 1, true)

gpu_set_blendenable(false)
shader_set(shaderFXAA)
global.application_texture = surface_get_texture(application_surface)
var texel_width = texture_get_texel_width(global.application_texture)
var texel_height = texture_get_texel_height(global.application_texture)
shader_set_uniform_f(global.shaderFXAA_texel, texel_width, texel_height)
shader_set_uniform_f(global.shaderFXAA_strength, 10) // 0 ~ 10
draw_surface_part_ext(application_surface, 0, 0, map_width, map_height, floor(map_x), floor(map_y), map_scale, map_scale, $ffffff, 1)
shader_reset()
gpu_set_blendenable(true)

//shader_set(shaderBlur)
//shader_set_uniform_f(global.shaderBlur_texel_size, texture_get_texel_width(global.application_texture), texture_get_texel_height(global.application_texture))
//draw_surface_part_ext(application_surface, 0, 0, map_real_width * 0.5, map_real_height, floor(map_x), floor(map_y), map_scale, map_scale, $ffffff, 1)
//shader_reset()
