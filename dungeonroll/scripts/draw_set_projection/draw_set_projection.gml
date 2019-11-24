/// @description draw_set_projection(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup)
/// @function draw_set_projection
/// @param xfrom { real }
/// @param yfrom { real }
/// @param zfrom { real }
/// @param xto { real }
/// @param yto { real }
/// @param zto { real }
/// @param xup { real }
/// @param yup { real }
/// @param zup { real }
var matrix_project = matrix_build_lookat(argument0, argument1, argument2, argument3, argument4, argument5,argument6, argument7, argument8)
var acamera = camera_get_active()
camera_set_view_mat(acamera, matrix_project)
camera_apply(acamera)