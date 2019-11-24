/// @description 상표 건너뛰기
if !skipped {
	skipped = true

	if logo_time < logo_period
		logo_time = logo_period

	if logo_disappear_time == 0
		logo_disappear_period = logo_disappear_period_short
}
