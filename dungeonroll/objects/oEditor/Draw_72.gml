/// @description 배경 그리기
for (var i = 0; i < editor_nodes_size_w; ++i) {
	for (var j = 0; j < editor_nodes_size_h; ++j)
		draw_sprite(sTileExample, 0, i * 16, j * 16)
}
draw_set_color(0)

