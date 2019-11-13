/// @description editor_clear_objects(target)
/// @function editor_clear_objects
/// @param target { object }
if instance_exists(argument0) {
	instance_destroy(argument0)

	editor_check_modified()
}
