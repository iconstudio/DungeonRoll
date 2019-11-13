/// @description editor_map_open_process()
/// @function editor_map_open_process
var new_path = get_open_filename_ext(map_extension_filter, "", working_directory, "지도를 선택해주세요.")
if new_path != "" { // 취소하지 않았다면
	editor_map_close()
	editor_map_open(new_path)

	map_filepath_current = new_path
	map_filename_current = filename_name(new_path)

	editor_check_unmodified()
}

return new_path
