/// @description editor_callback_new()
/// @function editor_callback_new
if map_modified {
	map_msg_save_from_new = show_question_async("지도가 수정되었습니다. 저장할까요?")
} else {
	if map_filepath_current != "" {
		editor_map_close()
		editor_menu_select(editor_menu.node_modify)
	}
}
