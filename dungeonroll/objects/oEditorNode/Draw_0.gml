/// @description 연결 선 그리기
if instance_exists(next) {
	draw_set_alpha(0.4)
	draw_set_color($ff)
	draw_line(next.x + 8, next.y + 8, x + 8, y + 8)
	draw_set_alpha(1)
}
draw_self()
