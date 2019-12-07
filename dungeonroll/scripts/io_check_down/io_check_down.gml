/// @description io_check_down()
/// @function io_check_down
with oGamepad {
	if index != -1
		return gamepad_button_check(index, gp_padd) or gamepad_axis_value(index, gp_axislv) > 0.5
}
return false
