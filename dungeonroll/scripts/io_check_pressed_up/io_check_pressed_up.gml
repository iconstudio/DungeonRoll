/// @description io_check_pressed_up()
/// @function io_check_pressed_up

if index != -1
	return gamepad_button_check_pressed(index, gp_padu) or (gamepad_axis_value(index, gp_axislv) < -0.98 and current_time mod 3 == 0)

return false
