/// @description 비동기 버퍼 처리
/*if ds_map_find_value(async_load, "id") == map_msg_buffer_save {
	var flag = bool(ds_map_find_value(async_load, "status"))
	if map_async_state == editor_buffer_state.saving
		map_save_failed = !flag

	map_msg_buffer_save = -1
	map_async_state = editor_buffer_state.none
	buffer_delete(map_buffer)
}
