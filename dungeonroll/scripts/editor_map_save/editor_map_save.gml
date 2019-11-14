/// @description editor_map_save(filename)
/// @function editor_map_save
/// @param filename { string }
/*
			지도 파일 구조
			- *: if nothing than it is 0
			- 노드는 서로 연결된 노드끼리만 엮인 노드 사슬 목록 안에 노드의 목록이 들어있는 구조이다.
		+------------------------------------------------------------------------------------------------------------------------------+
		|  version (string)
		|  caption (string)
		|  author (string)
		|  date (string)
		|  crypto key (hash string of author+date+number of tile+doodad+entity)
		|  size of node chain list (integer)
		|  size of tile list (integer)
		|  size of doodad list (integer)
		|  size of entity list (integer)
		|  *node chain list [[size of node list (integer), *node list [[x, y, type (integer), level], [x, y, type, level], ...]], ...]
		|  *tile list [[index0 from palette (integer, not a sprite), x, y, img_index], [index1, x, y, img_index], ...]
		|  *doodad list [[index0 from palette (integer, not a sprite), x, y], [index1, x, y], ...]
		|  *entity list [[index0 from palette (integer, not an object), x, y], [index1, x, y], ...]
		|  
		|  eof
		+------------------------------------------------------------------------------------------------------------------------------+
*/
map_async_state = editor_buffer_state.saving
map_buffer = buffer_create(1024, buffer_grow, 1)
buffer_write(map_buffer, buffer_string, GM_version)
buffer_write(map_buffer, buffer_string, map_filename_current)
buffer_write(map_buffer, buffer_string, "user")
buffer_write(map_buffer, buffer_string, string(date_current_datetime()))
//var key = random_get_seed()
//editor_map_write_crypto(map_buffer, key)
buffer_write(map_buffer, buffer_string, "10")


map_msg_buffer_save = buffer_save_async(map_buffer, argument0, 0, buffer_get_size(map_buffer))
