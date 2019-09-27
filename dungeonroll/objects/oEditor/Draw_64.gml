/// @description 도구 버튼 그리기
draw_set_alpha(1)
draw_set_color($ffffff)

draw_set_halign(1)
draw_set_valign(1)
var i, tool_data, tool_draw_x
for (i = 0; i < tool_number; ++i) {
	tool_data = tool_datas[i]
	tool_draw_x = tool_frame_width * i

	draw_rectangle(tool_draw_x, 0, tool_draw_x + tool_frame_width, tool_frame_height, true)
	draw_text(tool_draw_x + tool_frame_width * 0.5, tool_caption_draw_y, tool_data[0])
}

draw_set_halign(2)
draw_set_valign(2)
draw_text(floor(editor_width - 16), floor(editor_height - 16), tool_captions[tool_mode])
