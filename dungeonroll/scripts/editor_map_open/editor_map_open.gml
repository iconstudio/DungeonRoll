/// @description editor_map_open(filename)
/// @function editor_map_open
/// @param filename { string }
map_async_state = editor_buffer_state.loading
map_buffer = buffer_load(argument0)
if !buffer_exists(map_buffer) {
	show_message_async("편집기에서 지도를 불러오는 도중에 문제가 발생했습니다! \n" + string(map_buffer))
	map_load_failed = true
	return false
}

var map_version = buffer_read(map_buffer, buffer_string)
if map_version != GM_version { // 다른 판본의 지도일떄, 변환 시작하기
	
}

buffer_read(map_buffer, buffer_string) // filename
buffer_read(map_buffer, buffer_string) // author
buffer_read(map_buffer, buffer_string) // date
buffer_read(map_buffer, buffer_string) // crypto key

var node_chain_size = buffer_read(map_buffer, buffer_u16)
if 0 < node_chain_size {
	
} else {
	buffer_read(map_buffer, buffer_u16) // 0
}

var tile_size = buffer_read(map_buffer, buffer_u16)
if 0 < tile_size {
	var list = ds_list_create()
	var data = ds_list_read(list, buffer_read(map_buffer, buffer_string)) // (palette_index,x,y,img_index,img_speed)

	for (var i = 0; i < tile_size; ++i) {
		
	}	
} else {
	buffer_read(map_buffer, buffer_u16) // 0
}

var doodad_size = buffer_read(map_buffer, buffer_u16)
if 0 < doodad_size {
	
} else {
	buffer_read(map_buffer, buffer_u16) // 0
}

var entity_size = buffer_read(map_buffer, buffer_u16)
if 0 < entity_size {
	
} else {
	buffer_read(map_buffer, buffer_u16) // 0
}

map_msg_buffer_load = -1
map_async_state = editor_buffer_state.none

return true
