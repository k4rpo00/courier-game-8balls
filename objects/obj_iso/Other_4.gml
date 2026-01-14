var _iso_sprite = iso_sprite;
var _iso_subimg = iso_subimg;
with (obj_tile) if (iso_sprite >= 0) {
    var _x = round(x / 32);
    var _y = round(y / 32);
    //
    ds_grid_set(_iso_sprite, _x, _y, iso_sprite);
    ds_grid_set(_iso_subimg, _x, _y, iso_subimg);
}
if (room != rm_test) exit; 


if (ds_exists(iso_grid, ds_type_grid)) ds_grid_destroy(iso_grid);

iso_grid = ds_grid_create(128, 128);

global.zoom = 1;
global.zoom_min = 0.5;
global.zoom_max = 2.5;
    
global.base_view_w = __view_get(e__VW.WView, 0);
global.base_view_h = __view_get(e__VW.HView, 0);

