/// @description 초기화
window_width = window_get_width()
window_height = window_get_height()

enum theme {
	ruins,
	desert,
	wasteland, // 황무지
	wasteland_,
	plains_lava, // 용암 지대
	mountain_volcano, // 화산 지대
	plains, // 
	forest,
	mountain,
	forest_darker,
	forest_autumn,
	cold,
	coldest
}

global.board = noone
