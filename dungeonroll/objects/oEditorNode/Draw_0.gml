/// @description 연결 선과 정보 그리기
draw_set_alpha(1)
draw_set_font(fontEditorNode)
draw_set_halign(1)
draw_set_valign(1)

if instance_exists(next) {
	draw_set_color($f68080)
	draw_arrow(next.x + 8, next.y + 8, x + 8, y + 8, 4)
	draw_self()
	
	if !instance_exists(before) {
		draw_set_color($ff8000)
		draw_text(x + 8, y + 8, "시작")
	} else if first {
		draw_set_color($ffff00)
		draw_text(x + 8, y + 8, "시작")
	}
} else {
	draw_self()

	draw_set_color($ff8000)
	draw_text(x + 8, y + 8, "끝")
}
