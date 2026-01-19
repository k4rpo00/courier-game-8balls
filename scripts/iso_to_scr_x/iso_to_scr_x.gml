/// @description  iso_to_scr_x(iso_x, iso_y)
/// @param iso_x
/// @param  iso_y
function iso_to_scr_x(ix, iy) {
    return (ix - iy) * ISO_MUL_X;
}