/// @description io_check_right()
/// @function io_check_right
with oGamepad {
	if index != -1
		return gamepad_button_check(index, gp_padr) or gamepad_axis_value(index, gp_axislh) > 0.5
}
return false
