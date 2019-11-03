/// @description 연결 선 그리기
draw_set_alpha(1)

if instance_exists(next) {
	draw_set_color($80)
	draw_arrow(next.x + 8, next.y + 8, x + 8, y + 8, 4)
	draw_self()
	
	if !instance_exists(before) {
		draw_set_color($ff8000)
		draw_set_font(fontEditorNode)
		draw_set_halign(1)
		draw_set_valign(1)
		draw_text(x + 8, y + 8, "시작")
	}
} else {
	draw_self()

	draw_set_color($ff8000)
	draw_set_font(fontEditorNode)
	draw_set_halign(1)
	draw_set_valign(1)
	draw_text(x + 8, y + 8, "끝")
}
