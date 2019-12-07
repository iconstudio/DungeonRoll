/// @description io_check_up()
/// @function io_check_up
with oGamepad {
	if index != -1
		return gamepad_button_check(index, gp_padu) or gamepad_axis_value(index, gp_axislv) < -0.5
}
return false
