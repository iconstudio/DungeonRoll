/// @description 어플리케이션 서피스 그리기
// 가장자리 경계 그리기
draw_set_color($b2b2b2)
draw_rectangle(view_limit[0] - 1, view_limit[1] - 1, view_limit[2] + map_width + 1, view_limit[3] + map_height + 1, true)

shader_set(ColourDistortion)
shader_set_uniform_f(shader_get_uniform(OuterBlur,"maxBlurStrength"), 45.0)
shader_set_uniform_f(shader_get_uniform(OuterBlur,"resolution"), 1920)
shader_set_uniform_f(shader_get_uniform(OuterBlur,"radius"), 0.5)
shader_set_uniform_f(shader_get_uniform(OuterBlur,"dir"), 0.15)
draw_surface_ext(application_surface, floor(map_x), floor(map_y), map_scale, map_scale, 0, $ffffff, 1)
shader_reset()
