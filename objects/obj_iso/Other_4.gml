if (room != rm_test) exit;

var _iso_sprite = iso_sprite;
var _iso_subimg = iso_subimg;

with (obj_tile) {
    if (iso_sprite >= 0) {
        var _x = round(x / 32);
        var _y = round(y / 32);

        if (_x >= 0 && _x < other.cols && _y >= 0 && _y < other.rows) {
            ds_grid_set(_iso_sprite, _x, _y, iso_sprite);
            ds_grid_set(_iso_subimg, _x, _y, iso_subimg);
        }
    }
}


if (variable_instance_exists(id, "iso_grid")) {
    if (is_real(iso_grid) && ds_exists(iso_grid, ds_type_grid)) {
        ds_grid_destroy(iso_grid);
    }
}


iso_grid = ds_grid_create(128, 128);

scr_apply_zoom();
