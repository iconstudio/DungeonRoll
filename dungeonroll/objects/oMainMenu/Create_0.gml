LEFT = 0
RIGHT = 1
UP = 2
DOWN = 3
draw_set_font(fontMenu)

menu_item_size_half = 300
menu_item_margin_size = 32
menu_item_size_half = menu_item_size_half + menu_item_margin_size
menu_item_gap = menu_item_size_half * 2 + menu_item_margin_size
menu_coordinates = array_create(4)
menu_coordinates[LEFT] = [menu_item_size_half, 180]
menu_coordinates[RIGHT] = [menu_item_size_half, 0]
menu_coordinates[UP] = [menu_item_size_half, 90]
menu_coordinates[DOWN] = [menu_item_size_half, 270]

menu_number = 0
menu_items = 0
menu_items_number = 0
menu_item_selected = 0
menu_challange_continue = menu_create()
menu_item_add(menu_challange_continue, "계속", LEFT, -1)
menu_item_add(menu_challange_continue, "정보", UP, -1)
menu_item_add(menu_challange_continue, "다시 시작", DOWN, -1)

menu_challange = menu_create()
menu_item_add(menu_challange, "계속", LEFT, -1)
menu_item_add(menu_challange, "기록", UP, -1)
menu_item_add(menu_challange, "새로 시작", DOWN, -1)

menu_main = menu_create()
menu_item_add(menu_main, "도전", LEFT, -1)
menu_item_add(menu_main, "게임", RIGHT, -1)
menu_item_add(menu_main, "설정", UP, -1)
menu_item_add(menu_main, "종료", DOWN, -1)
menu_center = menu_main

menu_game = menu_create()
menu_item_add(menu_game, "캠페인", RIGHT, -1)
menu_item_add(menu_game, "무한", UP, -1)
menu_item_add(menu_game, "대전", DOWN, -1, false)

menu_campaign = menu_create()
menu_item_add(menu_campaign, "계속", RIGHT, -1)
menu_item_add(menu_campaign, "정보", UP, -1)
menu_item_add(menu_campaign, "다시 시작", DOWN, -1)

menu_index = menu_center
menu_index_previous = menu_index
menu_select(menu_center)
menu_pushing = false // 방향키로 메뉴 전환 중 여부
menu_dragging = false // 마우스로 메뉴 드래그 중 여부
menu_scroll = menu_index * menu_item_gap
menu_scroll_easer_default = ease_out_quartic
menu_scroll_easer_bounce = ease_out_elastic
menu_scroll_easer = menu_scroll_easer_default
menu_scroll_begin = menu_scroll
menu_scroll_mover_coord_begin = [-1, -1]
menu_push_period = seconds(0.4)
menu_push_time = menu_push_period
