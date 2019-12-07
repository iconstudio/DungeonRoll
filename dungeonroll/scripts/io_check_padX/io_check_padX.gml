/// @description io_check_padA()
/// @function io_check_padA
with oGamepad {
	return index != -1 and gamepad_button_check(index, gp_face3)
}
return false
