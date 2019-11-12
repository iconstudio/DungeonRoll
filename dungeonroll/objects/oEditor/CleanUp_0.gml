/// @description 서피스 제거
if surface_exists(global.editor_surface)
	surface_free(global.editor_surface)

ds_list_destroy(undo_list)
