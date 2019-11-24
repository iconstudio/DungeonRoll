if logo_appear_time < logo_appear_period {
	image_alpha = logo_appear_time / logo_appear_period

	logo_appear_time++
} else if logo_time < logo_period {
	image_alpha = 1

	logo_time++
} else if logo_disappear_time < logo_disappear_period {
	image_alpha = 1 - logo_disappear_time / logo_disappear_period

	logo_disappear_time++
}