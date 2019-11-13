/// @description editor_callback_open()
/// @function editor_callback_open
if map_modified {
	map_msg_save_from_open = show_question_async("지도가 수정되었습니다. 저장할까요?")
} else {
	editor_map_open_process()
}
