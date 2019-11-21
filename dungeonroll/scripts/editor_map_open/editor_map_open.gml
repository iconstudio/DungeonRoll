/// @description editor_map_open(filename)
/// @function editor_map_open
/// @param filename { string }
map_async_state = editor_buffer_state.loading
var filename = argument[0]
map_buffer = buffer_load(filename)
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

var node_size = buffer_read(map_buffer, buffer_u16)
if 0 < node_size {
	var node_list = ds_list_create()
	var node_map = ds_map_create(), node_id_map = ds_map_create()
	ds_list_read(node_list, buffer_read(map_buffer, buffer_string))
	ds_map_read(node_map, buffer_read(map_buffer, buffer_string))
	if ds_map_size(node_map) < node_size
		show_error("편집기에서 연결된 노드 쌍의 맵을 불러오는 중에 문제가 생겼습니다!", true)

	for (var i = 0; i < node_size; ++i) {
		var item = ds_list_find_value(node_list, i)
		var node_info = string_split(item, ",")

		if is_array(node_info) {
			with editor_node_place(node_info[1], node_info[2]) {
				uid = node_info[0] // 커스텀 직렬 번호
				first = node_info[3]
				type = node_info[4]
				data0 = node_info[5]
				data1 = node_info[6]
				ds_map_add(node_id_map, uid, id)
			}
		} else {
			show_error("편집기에서 노드 목록을 불러오는 중에 문제가 생겼습니다!", true)
		}
	}

	with oEditorNode {
		var linker = node_map[? uid] // 다음 노드
		if linker != "-" {
			if ds_map_exists(node_id_map, linker) {
				var node_id = node_id_map[? linker] // 다음 노드의 번호
				editor_node_link(id, node_id)
			} else {
				show_error("노드 직렬 번호 맵에서 다음 노드를 찾을 수 없습니다!", true)
			}
		}
	}

	ds_list_destroy(node_list)
	ds_map_destroy(node_map)
	ds_map_destroy(node_id_map)
} else {
	buffer_read(map_buffer, buffer_u16) // 0
	buffer_read(map_buffer, buffer_u16) // 0
}

var tile_size = buffer_read(map_buffer, buffer_u16)
if 0 < tile_size {
	var list = ds_list_create()
	ds_list_read(list, buffer_read(map_buffer, buffer_string)) // (palette_index,x,y,img_index,img_speed)

	for (var i = 0; i < tile_size; ++i) {
		var item = ds_list_find_value(list, i)
		var tile = string_split(item, ",")

		if is_array(tile) {
			with instance_create_layer(tile[1], tile[2], "Tiles", oEditorTile) {
				var tile_info = other.sidepanel_tiles[tile[0]]
				sprite_index = tile_info[0]
				image_index = tile[3]
				image_speed = tile[4]
			}
		} else {
			show_error("편집기에서 타일 목록을 불러오는 중에 문제가 생겼습니다!", true)
		}
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

buffer_read(map_buffer, buffer_string) // "10"

map_msg_buffer_load = -1
map_async_state = editor_buffer_state.none
editor_check_unmodified()
buffer_delete(map_buffer)

return true
