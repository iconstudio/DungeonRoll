/// @description editor_map_open(filename)
/// @function editor_map_open
/// @param filename { string }
map_async_state = editor_buffer_state.saving

map_msg_buffer_save = buffer_load_async(map_buffer, argument0, 0, buffer_get_size(map_buffer))
