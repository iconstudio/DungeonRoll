/// @description draw_stack_pop(time)
/// @function draw_stack_pop
var m = matrix_stack_top()
matrix_stack_pop()
matrix_set(matrix_world, m)
