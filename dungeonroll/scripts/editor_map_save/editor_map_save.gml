/// @description editor_map_save(filename)
/// @function editor_map_save
/// @param filename { string }
map_async_state = editor_buffer_state.saving
map_buffer = buffer_create(1024, buffer_grow, 1)
buffer_write(map_buffer, buffer_string, GM_version)
buffer_write(map_buffer, buffer_string, map_filename_current)
buffer_write(map_buffer, buffer_string, "user")
buffer_write(map_buffer, buffer_string, string(date_current_datetime()))
//var key = random_get_seed()
//editor_map_write_crypto(map_buffer, key)
buffer_write(map_buffer, buffer_string, "10")

var node_number = instance_number(oEditorNode)
var tile_number = instance_number(oEditorTile)
var doodad_number = instance_number(oEditorDoodad)
var entity_number = instance_number(oEditorEntity)

show_debug_message("\n")
if 0 < node_number {
	var node_list = ds_list_create()
	var node_map = ds_map_create()
	with oEditorNode {
		var content = string_link(uid, x, y, first, type, data0, data1)
		ds_list_add(node_list, content)
		if instance_exists(next)
			ds_map_add(node_map, uid, next.uid)
		else
			ds_map_add(node_map, uid, "-")
		show_debug_message(content)
	}

	buffer_write(map_buffer, buffer_u16, node_number)
	buffer_write(map_buffer, buffer_string, ds_list_write(node_list))
	buffer_write(map_buffer, buffer_string, ds_map_write(node_map))

	ds_list_destroy(node_list)
	ds_map_destroy(node_map)
} else {
	buffer_write(map_buffer, buffer_u16, 0) // size of node list
	buffer_write(map_buffer, buffer_u16, 0) // node list
	buffer_write(map_buffer, buffer_u16, 0) // node list
}

if 0 < tile_number {
	var tile_list = ds_list_create()
	with oEditorTile {
		var content = string_link(palette_index, x, y, image_index, image_speed)
		ds_list_add(tile_list, content)
		show_debug_message(content)
	}

	buffer_write(map_buffer, buffer_u16, tile_number)
	buffer_write(map_buffer, buffer_string, ds_list_write(tile_list))
	ds_list_destroy(tile_list)
} else {
	buffer_write(map_buffer, buffer_u16, 0) // size of tile list
	buffer_write(map_buffer, buffer_u16, 0) // tile list
}

if 0 < doodad_number {
	var doodad_list = ds_list_create()
	with oEditorDoodad
		ds_list_add(doodad_list, string_link(palette_index, x, y, image_index))

	var data = ds_list_write(doodad_list)
	buffer_write(map_buffer, buffer_u16, doodad_number)
	buffer_write(map_buffer, buffer_string, data)
	ds_list_destroy(doodad_list)
} else {
	buffer_write(map_buffer, buffer_u16, 0) // size of doodad list
	buffer_write(map_buffer, buffer_u16, 0) // doodad list
}

if 0 < entity_number {
	var entity_list = ds_list_create()
	with oEditorEntity
		ds_list_add(entity_list, string_link(palette_index, x, y))

	var data = ds_list_write(entity_list)
	buffer_write(map_buffer, buffer_u16, entity_number)
	buffer_write(map_buffer, buffer_string, data)
	ds_list_destroy(entity_list)
} else {
	buffer_write(map_buffer, buffer_u16, 0) // size of entity list
	buffer_write(map_buffer, buffer_u16, 0) // entity list
}
buffer_write(map_buffer, buffer_string, "10")

buffer_save(map_buffer, argument0)
