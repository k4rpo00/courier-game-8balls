var _iso_sprite = iso_sprite;
var _iso_subimg = iso_subimg;
with (obj_tile) if (iso_sprite >= 0) {
    var _x = round(x / 32);
    var _y = round(y / 32);
    //
    ds_grid_set(_iso_sprite, _x, _y, iso_sprite);
    ds_grid_set(_iso_subimg, _x, _y, iso_subimg);
}

