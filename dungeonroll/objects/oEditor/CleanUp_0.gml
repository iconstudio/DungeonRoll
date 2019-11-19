/// @description 메모리 정리
if surface_exists(global.editor_surface)
	surface_free(global.editor_surface)

if buffer_exists(map_buffer)
	buffer_delete(map_buffer)

ds_list_destroy(undo_list)
