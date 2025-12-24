/// @description  Draw help
if (!ds_exists(iso_sprite, ds_type_grid) || !ds_exists(iso_subimg, ds_type_grid)) {
    exit;
}
draw_set_font(fnt_test);
for (var i = 0; i < 2; i += 1) {
    if (i > 0) draw_set_color(c_white); else draw_set_color(c_black);
}

