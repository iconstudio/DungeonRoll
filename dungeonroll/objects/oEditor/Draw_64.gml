/// @description 도구 그리기
draw_set_alpha(1)
draw_set_color(menu_frame_color)
draw_rectangle(0, 0, editor_width, menu_frame_height, false)

menu_data = menu_items[menu_mode]

// 메뉴 강조 사각형 그리기
draw_set_alpha(menu_frame_indicator_open_alpha)
draw_set_color($ffffff)
draw_rectangle(menu_frame_indicator_open_left, 0, menu_frame_indicator_open_right, menu_frame_indicator_y, false)

// 메뉴 제목 그리기
var i, menu_data
draw_set_alpha(1)
draw_set_color(0)
draw_set_halign(1)
draw_set_valign(2)
for (i = 0; i < menu_number; ++i) {
	menu_data = menu_items[i]
	draw_text(menu_data[5], menu_frame_caption_y, menu_data[0])
}

// 표시기 그리기
var indicator_width_half = menu_data[1] * 0.5
var indicator_left = menu_frame_indicator_x - indicator_width_half
var indicator_right = menu_frame_indicator_x + indicator_width_half
draw_set_color(menu_frame_indicator_color)
draw_rectangle(indicator_left, menu_frame_indicator_y, indicator_right, menu_frame_indicator_y + menu_frame_indicator_height, false)

// 메뉴 설명 그리기
draw_set_color($ffffff)
draw_set_halign(2)
draw_set_valign(2)
draw_text(floor(editor_width - 16), floor(editor_height - 16), menu_data[2])
