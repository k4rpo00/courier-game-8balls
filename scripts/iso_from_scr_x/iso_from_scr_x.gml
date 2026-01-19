/// @description  iso_from_scr_x(scr_x, scr_y)
/// @param scr_x
/// @param  scr_y
function iso_from_scr_x(sx, sy) {
    return (sy / ISO_MUL_Y + sx / ISO_MUL_X) * 0.5;
}
