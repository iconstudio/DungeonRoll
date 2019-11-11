/// @description dice_get(side, [number])
/// @function dice_get
/// @param side { integer }
/// @param [number] { integer }
var number = argument_count > 1 ? argument[1] : 1
return irandom_range(number, number * argument[0])
