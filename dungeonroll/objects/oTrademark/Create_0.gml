/// @description 초기화
x = room_width * 0.5
y_begin = room_height * 0.5// - 500
y_target = room_height * 0.5
y = y_begin

xscale_begin = 1//50
xscale_target = 1//0.5
image_xscale = xscale_begin
image_yscale = image_xscale

skipped = false
logo_appear_time = 0
logo_appear_period = 10//seconds(4)
logo_time = 0
logo_period = seconds(2)
logo_disappear_time = 0
logo_disappear_period = seconds(0.2)
logo_disappear_period_short = seconds(0.1)

alarm[0] = 1
