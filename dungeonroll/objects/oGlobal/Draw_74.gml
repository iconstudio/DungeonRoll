/// @description 어플리케이션 서피스 그리기
if room != roomEditor {
	if global.shader_supported {
		gpu_set_blendenable(false)
		shader_set(shaderFXAA)
		shader_set_uniform_f(global.shaderFXAA_texel, global.application_texel_width, global.application_texel_height)
		shader_set_uniform_f(global.shaderFXAA_strength, 4) // 0 ~ 10
		draw_surface(application_surface, global.application_offset[0], global.application_offset[1])
		shader_reset()
		gpu_set_blendenable(true)
	} else {
		draw_surface(application_surface, global.application_offset[0], global.application_offset[1])
	}
}