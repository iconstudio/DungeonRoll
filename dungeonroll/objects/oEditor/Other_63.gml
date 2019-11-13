/// @description 비동기 저장 및 불러오기 처리
var async_id = ds_map_find_value(async_load, "id")
if async_id == map_msg_save_from_open { // 다른 지도를 열때
	var answer = ds_map_find_value(async_load, "status")
	var save_canceled = "."
	if answer
		save_canceled = editor_map_save_process()

	// 다른 지도 열기
	if save_canceled != ""
		editor_map_open_process()
	map_msg_save_from_open = -1
} else if async_id == map_msg_save_from_new { // 새 지도를 만들때
	var answer = ds_map_find_value(async_load, "status")
	var save_canceled = ""
	if answer
		save_canceled = editor_map_save_process()

	// 새 지도 만들기
	if save_canceled != ""
		editor_map_close()
	//editor_menu_select(editor_menu.node_modify)
	map_msg_save_from_new = -1
}
