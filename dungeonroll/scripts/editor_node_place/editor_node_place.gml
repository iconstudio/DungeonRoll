/// @description editor_node_place(x, y, [next], [before])
/// @function editor_node_place
/// @param x { real }
/// @param y { real }
/// @param [next] { instance }
/// @param [before] { instance }
var node = instance_create_layer(argument[0], argument[1], "Nodes", oEditorNode)
if 2 < argument_count {
	node.next = argument[2]
	if 3 < argument_count
		node.before = argument[3]
}

return node
