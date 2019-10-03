/// @description 도구 버튼 그리기
draw_set_alpha(1)
draw_set_color(menu_frame_color)
draw_rectangle(0, 0, editor_width, menu_frame_height, false)

draw_set_color(0)
draw_set_halign(1)
draw_set_valign(2)
var i, menu_data, menu_draw_width, menu_draw_x = 0
for (i = 0; i < menu_number; ++i) {
	menu_data = menu_items[i]
	menu_draw_width = menu_frame_width_addition * 2 + menu_data[1]

	draw_text(menu_draw_x + menu_draw_width * 0.5, menu_frame_caption_y, menu_data[0])

	if i == menu_mode {
		draw_set_color(menu_frame_indicator_color)
		draw_rectangle(menu_draw_x, menu_frame_indicator_y, menu_draw_x + menu_draw_width, menu_frame_indicator_y + menu_frame_indicator_height, false)
		draw_set_color(0)
	}

	menu_draw_x += menu_draw_width
}

draw_set_color($ffffff)
draw_set_halign(2)
draw_set_valign(2)
draw_text(floor(editor_width - 16), floor(editor_height - 16), menu_captions[menu_mode])
