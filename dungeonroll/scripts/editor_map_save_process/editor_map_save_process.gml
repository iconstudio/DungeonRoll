/// @description editor_map_save_process()
/// @function editor_map_save_process
if map_filepath_current != "" { // 열린 지도에 저장
	editor_map_save(map_filepath_current)
	editor_check_unmodified()

	return map_filepath_current
} else { // 새 지도에 저장
	var new_path = get_save_filename_ext(map_extension_filter, "", working_directory, "지도를 저장할 위치를 정해주세요.")
	if new_path != "" { // 취소하지 않았다면
		editor_map_save(new_path)

		map_filepath_current = new_path
		map_filename_current = filename_name(new_path)
		editor_check_unmodified()
	}

	return new_path
}
