menu_number = 0
menu_center = 2

menu_item_gap = 576 // 512 + 64
menu_scroll = 0

/*
	 메뉴 위치
			[2]
		[0] [1]
			[3]
*/
LEFT = 0
RIGHT = 1
UP = 2
DOWN = 3
draw_set_font(fontMenu)

menu_item_size = 160
menu_coordinates = array_create(4)
menu_coordinates[LEFT] = [menu_item_size, 180]
menu_coordinates[RIGHT] = [menu_item_size, 0]
menu_coordinates[UP] = [menu_item_size, 90]
menu_coordinates[DOWN] = [menu_item_size, 270]

menu_item_clear(0, 1)
menu_item_add(0, "도전", menu_callback_challenge) // 오른쪽
menu_item_add(0, "게임", menu_callback_play) // 왼쪽
menu_item_add(0, "설정", -1) // 위쪽
menu_item_add(0, "종료", -1) // 아래쪽
