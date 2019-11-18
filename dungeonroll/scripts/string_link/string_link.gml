/// @description string_link(str1, [...])
/// @function string_link
/// @param str1 { string }
/// @param [...] { string }
var result = ""
for (var i = 0; i < argument_count; ++i) {
	result += string(argument[i])
	if i != argument_count - 1
		result += ","
}

return result
