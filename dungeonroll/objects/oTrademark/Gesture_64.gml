/// @description 상표 건너뛰기
if !skipped {
	skipped = true

	if logo_time < logo_period - 1
		logo_time = logo_period - 1

	if logo_disappear_time == 0
		logo_disappear_period = logo_disappear_period_short
}
