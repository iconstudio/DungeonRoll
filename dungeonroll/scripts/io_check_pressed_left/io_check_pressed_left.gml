/// @description io_check_pressed_left()
/// @function io_check_pressed_left

if index != -1
	return gamepad_button_check_pressed(index, gp_padl) or (gamepad_axis_value(index, gp_axislh) < -0.98 and current_time mod 3 == 0)

return false
