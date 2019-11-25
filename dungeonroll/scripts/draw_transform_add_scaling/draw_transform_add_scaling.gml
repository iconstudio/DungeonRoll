/// @description draw_transform_add_scaling(xs, ys, zs)
/// @function draw_transform_add_scaling
/// @param xs { real }
/// @param ys { real }
/// @param zs { real }
var m = matrix_build_identity()
m[0] = argument0
m[5] = argument1
m[10] = argument2

var mw = matrix_get(matrix_world)
var mr = matrix_multiply(mw, m)
matrix_set(matrix_world, mr)
