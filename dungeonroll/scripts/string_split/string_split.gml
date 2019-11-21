/// @description string_split(str, token)
/// @function string_split
/// @param str { string }
/// @param token { string }
var str = argument0
var token = argument1
var result = [], token_number = 0
var token_length = string_length(token)

while string_length(str) != 0 {
	var next = string_pos(token, str)

	if next {
		if next != 1
			result[token_number++] = string_copy(str, 1, next - 1)
		str = string_copy(str, next + token_length, string_length(str))
  } else {
		result[token_number++] = str
		str = ""
  }
}
return result
