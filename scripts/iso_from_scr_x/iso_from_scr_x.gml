/// @description  iso_from_scr_x(scr_x, scr_y)
/// @param scr_x
/// @param  scr_y
function iso_from_scr_x(argument0, argument1) {
	return (argument1 / iso_mul_y + argument0 / iso_mul_x) / 2;



}
