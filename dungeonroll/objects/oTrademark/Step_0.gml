if logo_appear_time < logo_appear_period {
	var appear_ratio = logo_appear_time / logo_appear_period
	y = lerp(y_begin, y_target, ease_in_out_quintic(appear_ratio))
	image_xscale = lerp(xscale_begin, xscale_target, (appear_ratio))
	image_yscale = image_xscale

	logo_appear_time++
} else if logo_time < logo_period {
	
	image_xscale = xscale_target
	image_yscale = image_xscale

	logo_time++
} else if logo_disappear_time < logo_disappear_period {
	image_alpha = 1 - logo_disappear_time / logo_disappear_period

	logo_disappear_time++
} else {
	image_alpha = 0
	room_goto_next()
}
