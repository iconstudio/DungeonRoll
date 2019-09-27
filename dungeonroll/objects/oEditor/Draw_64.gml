/// @description 도구 버튼 그리기
draw_set_alpha(1)
draw_set_color($ffffff)

draw_set_halign(1)
draw_set_valign(1)
var i, tool_data
for (i = 0; i < tool_number; ++i) {
	tool_data = tool_datas[i]

	draw_text(tool_data[0], tool_data[1], tool_data[2])
}

draw_text(editor_width - 20, editor_height - 20, tool_mode)
