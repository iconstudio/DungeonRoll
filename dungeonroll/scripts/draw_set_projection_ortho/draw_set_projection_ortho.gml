/// @description draw_set_projection_ortho(x, y, w, h, angle)
/// @function draw_set_projection_ortho
/// @param x { real }
/// @param y { real }
/// @param w { real }
/// @param h { real }
/// @param angle { real }
var xo = argument0
var yo = argument1
var width = argument2
var height = argument3
var angle = argument4

var mV = matrix_build_lookat(xo + width * 0.5, yo + height * 0.5, -16000,
xo + width * 0.5, yo + height * 0.5, 0, dsin(-angle), dcos(-angle), 0)
var mP = matrix_build_projection_ortho(width, height, 1, 32000)

var acamera = camera_get_active()
camera_set_view_mat(acamera, mV)
camera_set_proj_mat(acamera, mP)
camera_apply(acamera)
