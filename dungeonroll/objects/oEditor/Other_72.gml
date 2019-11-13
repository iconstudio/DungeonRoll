/// @description 비동기 버퍼 처리
if ds_map_find_value(async_load, "id") == map_msg_buffer_save {
	if map_async_state == editor_buffer_state.loading
		map_load_failed = !bool(ds_map_find_value(async_load, "status"))
	else if map_async_state == editor_buffer_state.saving
		map_save_failed = !bool(ds_map_find_value(async_load, "status"))

	map_msg_buffer_save = -1
	map_async_state = editor_buffer_state.none
}
