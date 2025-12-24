/// @description  Draw tiles
for (var _x = 0; _x < cols; _x += 1)
for (var _y = 0; _y < rows; _y += 1) {
    var s = ds_grid_get(iso_sprite, _x, _y);
    if (s >= 0) {
        var ix = _x * 32;
        var iy = _y * 32;
        var rx = iso_to_scr_x(ix, iy);
        var ry = iso_to_scr_y(ix, iy);
        draw_sprite(s, ds_grid_get(iso_subimg, _x, _y), rx, ry);
    }
}

/// Draw cursor
draw_set_colour(c_red);
var cz = 10;
draw_line(
    iso_to_scr_x(cursor_x - cz, cursor_y),
    iso_to_scr_y(cursor_x - cz, cursor_y),
    iso_to_scr_x(cursor_x + cz, cursor_y),
    iso_to_scr_y(cursor_x + cz, cursor_y));
draw_line(
    iso_to_scr_x(cursor_x, cursor_y - cz),
    iso_to_scr_y(cursor_x, cursor_y - cz),
    iso_to_scr_x(cursor_x, cursor_y + cz),
    iso_to_scr_y(cursor_x, cursor_y + cz));

if (room == rm_test) {

    for (var _x = 0; _x < cols; _x += 1)
    for (var _y = 0; _y < rows; _y += 1) {
        var s = ds_grid_get(iso_sprite, _x, _y);
        if (s >= 0) {
            var ix = _x * 32;
            var iy = _y * 32;
            var rx = iso_to_scr_x(ix, iy);
            var ry = iso_to_scr_y(ix, iy);
            draw_sprite(s, ds_grid_get(iso_subimg, _x, _y), rx, ry);
        }
    }

    // cursor draw (optional)
}