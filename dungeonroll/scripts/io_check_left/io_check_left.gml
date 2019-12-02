/// @description io_check_left()
/// @function io_check_left
with oGamepad {
	if index != -1
		return gamepad_button_check(index, gp_padl) or gamepad_axis_value(index, gp_axislh) < -0.5
}
return false
