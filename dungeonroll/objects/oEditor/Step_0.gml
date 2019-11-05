/// @description 입력 및 갱신
cursor_x = device_mouse_x(0) - map_x
cursor_y = device_mouse_y(0) - map_y
cursor_gui_x = device_mouse_x_to_gui(0)
cursor_gui_y = device_mouse_y_to_gui(0)
var cursor_left_check = device_mouse_check_button(0, mb_left)
var cursor_right_check = device_mouse_check_button(0, mb_right)
var cursor_left_pressed = device_mouse_check_button_pressed(0, mb_left)
var cursor_right_pressed = device_mouse_check_button_pressed(0, mb_right) // 모바일에선 길게 터치
cursor_editor_innered = point_in_rectangle_fixed(cursor_x, cursor_y, 0, 0, map_real_width, map_real_height)
cursor_innered = point_in_rectangle_fixed(cursor_gui_x, cursor_gui_y, 0, 0, global.resolutions_gui[0], global.resolutions_gui[1])

#region submenu.bar
// 보조 메뉴 표시줄 갱신
var menu_frame_extend_ratio = menu_frame_extend_time / menu_frame_extend_period
if menu_frame_extended {
	menu_frame_height = lerp(menu_frame_height_min, menu_frame_height_max, ease_out_cubic(menu_frame_extend_ratio))

	menu_frame_submenu_show = true
	if menu_frame_extend_time < menu_frame_extend_period
		menu_frame_extend_time++
	else
		menu_frame_extend_time = menu_frame_extend_period
} else { // 닫기
	menu_frame_height = lerp(menu_frame_height_min, menu_frame_height_max, menu_frame_extend_ratio)

	if 0 < menu_frame_extend_time {
		menu_frame_extend_time--
	} else {
		menu_frame_submenu_show = false
		menu_frame_extend_time = 0
		menu_submenu_indicator_frame_time = 0
	}
}
#endregion

#region submenu.frame
// 보조 메뉴 강조
menu_submenu_indicator_frame_alpha = menu_submenu_indicator_frame_time / menu_submenu_indicator_frame_period
if menu_submenu_indicator_frame_draw {
	if menu_submenu_indicator_frame_time < menu_submenu_indicator_frame_period
		menu_submenu_indicator_frame_time++
	else
		menu_submenu_indicator_frame_time = menu_submenu_indicator_frame_period
} else {
	if 0 < menu_submenu_indicator_frame_time {
		menu_submenu_indicator_frame_time--
	} else {
		menu_submenu_indicator_frame_time = 0
	}
}
#endregion

// 커서 상태 및 메뉴 요소 갱신
menu_frame_indicator_on = -1
menu_submenu_indicator_frame_draw = false

if !cursor_innered {
	cursor_state = editor_cursor_state.on_outside
} else if !view_mover_dragging and 0 <= cursor_gui_y and cursor_gui_y < menu_frame_height {
	cursor_state = editor_cursor_state.on_ui

	#region mainmenu
	// 마우스로 주 메뉴 항목 선택
	if cursor_gui_y < menu_frame_height_min {
		// 보조 메뉴 표시줄 토글
		if doubletap
			menu_frame_extended = !menu_frame_extended

		for (var i = 0; i < menu_number; ++i) {
			var menu_data = menu_items[i]
			var frame_width_half = menu_data[4] * 0.5
			var frame_left = menu_data[5] - frame_width_half
			var frame_right = menu_data[5] + frame_width_half

			if frame_left <= cursor_gui_x and cursor_gui_x < frame_right {
				// 표시기 위치 정하기
				menu_frame_indicator_frame_left = frame_left
				menu_frame_indicator_frame_right = frame_right

				// 메뉴 설명 바꾸기
				menu_mode_description = menu_data[2]

				// 새로운 메뉴 가리키기
				if menu_frame_indicator_frame_previous != i {
					menu_frame_indicator_frame_time = 0

					menu_frame_indicator_frame_previous = i
				}

				if i == menu_mode {
					menu_frame_indicator_on = i

					if menu_frame_indicator_time < menu_frame_indicator_period
						menu_frame_indicator_time++
					else
						menu_frame_indicator_time = menu_frame_indicator_period
				}

				if menu_frame_indicator_frame_time < menu_frame_indicator_frame_period
					menu_frame_indicator_frame_time++
				else
					menu_frame_indicator_frame_time = menu_frame_indicator_frame_period

				if !doubletap and cursor_left_pressed {
					editor_menu_select(i)
				}
			}
		}
	#endregion
	#region submenu
	} else if menu_frame_extended and cursor_gui_y < menu_frame_height { // 보조 메뉴 선택
		var submenu_data, submenu_x = 0
		for (var j = 0; j < menu_submenu_number[menu_mode]; ++j) {
			submenu_data = menu_submenus[menu_mode, j]
			var frame_left = submenu_x
			var frame_right = submenu_x + submenu_data[4]

			if frame_left <= cursor_gui_x and cursor_gui_x < frame_right {
				menu_submenu_indicator_frame_draw = true
				menu_submenu_indicator_frame_left = frame_left
				menu_submenu_indicator_frame_right = frame_right

				if !doubletap and cursor_left_pressed {
					if script_exists(submenu_data[2])
						script_execute(submenu_data[2])
				}
			}
			submenu_x = frame_right
		}
	}
	#endregion

	window_set_cursor(cr_default)
} else {
	cursor_state = editor_cursor_state.normal

	if !view_mover_dragging {
		if menu_mode == editor_menu.cursor or menu_mode == editor_menu.setting {

		} else {
			cursor_node_x = (cursor_x) * map_scale_reverse div 16 * 16
			cursor_node_y = (cursor_y) * map_scale_reverse div 16 * 16

			if cursor_editor_innered
				window_set_cursor(cr_none)
			else
				window_set_cursor(cr_default)

			#region sidepanel
			// 우측 보조 창 선택
			if sidepanel_opened {
				var is_tile = menu_mode == editor_menu.tile
				var is_doodad = menu_mode == editor_menu.doodad
				var is_entity = menu_mode == editor_menu.entity
				var item_x_begin = sidepanel_x
				var item_y_begin = sidepanel_y

				if point_in_rectangle_fixed(cursor_gui_x, cursor_gui_y, item_x_begin, item_y_begin, item_x_begin + sidepanel_width, item_y_begin + sidepanel_height) {
					cursor_state = editor_cursor_state.on_ui

					for (var i = 0 ; i < sidepanel_item_count; ++i) {
						var item_positions = sidepanel_items_positions[i]
						var item_x = sidepanel_item_x_begin + item_positions[0]
						var item_y = sidepanel_item_y_begin + item_positions[1]

						if point_in_rectangle_fixed(cursor_gui_x, cursor_gui_y, item_x, item_y, item_x + sidepanel_item_size, item_y + sidepanel_item_size) {
							var sidepanel_cursor_new = -1, sidepanel_cursor_index_new = 0

							if is_tile { // 타일 선택하기
								sidepanel_cursor_new = editor_item_tile_get_sprite(i)
								if sidepanel_cursor_new == -1
									break
								sidepanel_cursor_index_new = editor_item_tile_get_img_index(i)
							} else if is_doodad { // 장식물 선택하기
								sidepanel_cursor_new = editor_item_doodad_get_sprite(i)
								sidepanel_cursor_index_new = 0
								if sidepanel_cursor_new == -1
									break
							} else if is_entity { // 개체 선택하기
								sidepanel_cursor_new = editor_item_object_get_sprite(i)
								sidepanel_cursor_index_new = 0
								if sidepanel_cursor_new == -1
									break
							}
							if sidepanel_cursor_new != -1
								window_set_cursor(cr_handpoint)

							if cursor_left_pressed {
								sidepanel_cursor = sidepanel_cursor_new
								sidepanel_cursor_index = sidepanel_cursor_index_new

								if is_tile
									editor_item_tile_select(i)
								else if is_doodad
									editor_item_doodad_select(i)
								else if is_entity
									editor_item_object_select(i)
							} // IF (cursor_left_pressed)
						} // IF (point_in_rectangle_fixed)
					} // FOR (sidepanel_item_count)
				}
			} // IF (sidepanel_opened)
			#endregion
		} // ELSE
	}
}

#region mainmenu.indicator
var indicator_ratio = menu_frame_indicator_time / menu_frame_indicator_period
var indicator_frame_ratio = menu_frame_indicator_frame_time / menu_frame_indicator_frame_period

if menu_frame_indicator_width_half_actual != menu_frame_indicator_width_half
	menu_frame_indicator_width_half_actual += (menu_frame_indicator_width_half - menu_frame_indicator_width_half_actual) * 0.2
menu_frame_indicator_width_half = lerp(menu_frame_indicator_width_half_begin, menu_frame_indicator_width_half_target, indicator_ratio)
menu_frame_indicator_frame_alpha = indicator_frame_ratio

// 인터페이스 상주 중이 아니면 강조 해제
if menu_frame_indicator_y <= cursor_gui_y or cursor_state != editor_cursor_state.on_ui {
	if menu_frame_indicator_x == menu_frame_indicator_x_target {
		if 0 < menu_frame_indicator_time
			menu_frame_indicator_time--
		else
			menu_frame_indicator_time = 0
	}
	if 0 < menu_frame_indicator_frame_time
		menu_frame_indicator_frame_time--
	else
		menu_frame_indicator_frame_time = 0

	// 메뉴 설명 원래대로 돌리기
	var menu_data = menu_items[menu_mode]
	menu_mode_description = menu_data[2]
} else {
	if menu_frame_indicator_on == -1 {
		if 0 < menu_frame_indicator_time
			menu_frame_indicator_time--
		else
			menu_frame_indicator_time = 0
	}
}
#endregion

// 시점 이동 중이 아닐 때
if !view_mover_dragging {
	// 숫자 키로 메뉴 항목 선택
	for (var i = editor_menu.cursor; i <= global.editor_menu_last; ++i) {
		if keyboard_check_pressed(49 + i) {
			// 마우스가 가리키는 항목의 설명을 우선한다.
			var description_previous = menu_mode_description
			editor_menu_select(i)
			menu_mode_description = description_previous
		}
	}

	if cursor_state == editor_cursor_state.normal
	and cursor_editor_innered {
		#region node
		if menu_mode == editor_menu.node_modify { //
			node_on_cursor = instance_place(cursor_node_x + 8, cursor_node_y + 8, oEditorNode)

			if cursor_left_pressed { // 노드 추가
				if instance_exists(node_on_cursor) {
					// 단방향 노드만 지원
					if node_modify_link_add and instance_exists(node_selected) and !instance_exists(node_on_cursor.before) {
						node_selected.next = node_on_cursor
						if node_on_cursor.first // 이을 다음 노드가 처음 노드라면 뒤에 올 선택한 노드는 처음 노드가 아니다.
							node_selected.first = false
						node_on_cursor.before = node_selected
					} else if instance_exists(node_on_cursor.next) {
						node_modify_link_add = false
						node_selected = noone
						if !instance_exists(node_on_cursor.before) // 이전 노드가 없으면 처음 노드가 된다.
							node_on_cursor.first = true
					} else {
						node_modify_link_add = true
						node_selected = node_on_cursor
					}
				} else {
					if node_modify_link_add and instance_exists(node_selected) { // 노드를 새로 추가하면서 자동으로 연결
						var node_last = node_selected
						node_selected = instance_create_layer(cursor_node_x, cursor_node_y, "Nodes", oEditorNode)
						node_last.next = node_selected
						node_selected.before = node_last
						node_selected.first = false // 새로 추가하는 노드는 기본적으로 연결되있으면서 처음 노드가 아니다.
					} else {
						node_modify_link_add = true
						node_selected = instance_create_layer(cursor_node_x, cursor_node_y, "Nodes", oEditorNode)
						node_selected.first = true // 아무것도 없이 첫 노드를 놓는다.
					}
				}
			} else if cursor_right_pressed { // 노드 삭제
				if instance_exists(node_on_cursor) {
					with node_on_cursor {
						if instance_exists(before) {
							before.next = noone

							before.first = false // 다음 노드가 없으면 끝 노드가 된다.
						}

						if instance_exists(next) {
							next.before = noone

							if first
								next.first = true // 이 노드가 처음 노드이어야지만 다음 노드가 처음 노드가 된다.
						}
					}
					instance_destroy(node_on_cursor)
				}

				// 선택 해제
				node_modify_link_add = false
				node_selected = noone
			}
			#endregion
		} else if menu_mode == editor_menu.tile { //
			if cursor_right_check {
				var tile_on_cursor = instance_place(cursor_node_x + 8, cursor_node_y + 8, oEditorTile)

				if instance_exists(tile_on_cursor) {
					instance_destroy(tile_on_cursor)
				}
			} else { // 스프라이트 타일 배치
				if cursor_left_check {
					var tile_on_cursor = instance_place(cursor_node_x + 8, cursor_node_y + 8, oEditorTile)
					var tile_new_sprite = editor_item_tile_get_sprite(sidepanel_tile_index)

					if instance_exists(tile_on_cursor) {
						if tile_on_cursor.sprite_index != tile_new_sprite { // 다른 스프라이트를 사용하면 바꾸기
							tile_on_cursor.sprite_index = tile_new_sprite
						}
					} else {
						(instance_create_layer(cursor_node_x, cursor_node_y, "Tiles", oEditorTile)).sprite_index = tile_new_sprite
					}
				}
			}
		} else if menu_mode == editor_menu.doodad { //
			if cursor_right_pressed {
				editor_menu_select(editor_menu.cursor)
			}
		} else if menu_mode == editor_menu.entity { //
			if cursor_right_pressed {
				editor_menu_select(editor_menu.cursor)
			}
		}
	}
}

// 사각형 강조 표시의 시간 증가
if menu_frame_indicator_x_time < menu_frame_indicator_x_period {
	var indicator_ratio = ease_out_quartic(menu_frame_indicator_x_time / menu_frame_indicator_x_period)
	menu_frame_indicator_x = lerp(menu_frame_indicator_x_begin, menu_frame_indicator_x_target, indicator_ratio)

	menu_frame_indicator_x_time++
} else {
	menu_frame_indicator_x = menu_frame_indicator_x_target

	menu_frame_indicator_x_time = menu_frame_indicator_x_period
}
sidepanel_y = menu_frame_height + sidepanel_pos_margin
sidepanel_item_y_begin = sidepanel_y + sidepanel_item_margin

#region view
event_user(2)

/* legacy
view_pos_y_limit[0] = view_pos_vborder - view_border - menu_frame_height

// 시점 이동
var view_xview_new = camera_get_view_x(view_camera)
var view_yview_new = camera_get_view_y(view_camera)

// 휠로 시점 이동 도중
if view_mover_dragging and device_mouse_check_button(0, view_mover_key) {
	if view_mover_x_begin != -1 and view_mover_y_begin != -1 {
		view_xview_target = view_pos_x_begin - (cursor_x - view_mover_x_begin)
		view_yview_target = view_pos_y_begin - (cursor_y - view_mover_y_begin)
	}
}

// 휠로 시점 이동 시작
if cursor_state == editor_cursor_state.normal and !view_mover_dragging {
	var touch_pressed = (view_moveable_with_touch and cursor_left_pressed)
	var middle_pressed = device_mouse_check_button_pressed(0, mb_middle)
	if touch_pressed or middle_pressed {
		if middle_pressed
			view_mover_key = mb_middle
		else if touch_pressed
			view_mover_key = mb_left
		view_mover_dragging = true

		view_pos_x_begin = camera_get_view_x(view_camera)
		view_pos_y_begin = camera_get_view_y(view_camera)
		view_mover_x_begin = cursor_x
		view_mover_y_begin = cursor_y
	}
}

if device_mouse_check_button_released(0, view_mover_key) {
	view_mover_dragging = false

	view_mover_x_begin = -1
	view_mover_y_begin = -1
}

// 실질적 시점 이동
if view_xview_new != view_xview_target or view_yview_new != view_yview_target {
	view_xview_adjusted = view_xview_new + (view_xview_target - view_xview_new) * 0.3
	view_yview_adjusted = view_yview_new + (view_yview_target - view_yview_new) * 0.3

	camera_set_view_pos(view_camera
	, max(view_pos_x_limit[0], min(view_xview_adjusted, view_pos_x_limit[1]))
	, max(view_pos_y_limit[0], min(view_yview_adjusted, view_pos_y_limit[1])))
}
*/
#endregion
