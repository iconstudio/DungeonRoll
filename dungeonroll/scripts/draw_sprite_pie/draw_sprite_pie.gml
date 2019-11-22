/// @description draw_sprite_pie(0sprite, 1subimg, 2x, 3y, 4startangle, 5endangle, 6color, 7alpha)
/// @function draw_sprite_pie
/// @param 0sprite { sprite }
/// @param 1subimg { real }
/// @param 2x { real }
/// @param 3y { real }
/// @param 4startangle { real }
/// @param 5endangle { real }
/// @param 6color { integer }
/// @param 7alpha { real }
var width2 = sprite_get_width(argument0) * 0.5
var height2 = sprite_get_height(argument0) * 0.5

draw_primitive_begin_texture(pr_trianglefan, sprite_get_texture(argument0, argument1))
draw_vertex_texture_color(argument2, argument3, 0.5, 0.5, argument6, argument7)
while true {
	var angle = degtorad(argument4), next = floor(argument4 / 45 + 1) * 45
	var dx = min(abs(tan(angle + pi / 2)), 1) * sign(cos(angle))
	var dy = min(abs(tan(angle)), 1) * sign(-sin(angle))
	draw_vertex_texture_color(argument2 + width2 * dx, argument3 + height2 * dy, dx * 0.5 + 0.5, dy * 0.5 + 0.5, argument6, argument7)

	if argument4 == argument5
		break

	if argument5 <= next
		argument4 = argument5
	else
		argument4 = next
}
draw_primitive_end()
