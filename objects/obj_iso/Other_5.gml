if (ds_exists(iso_sprite, ds_type_grid)) ds_grid_destroy(iso_sprite);
if (ds_exists(iso_subimg, ds_type_grid)) ds_grid_destroy(iso_subimg);
if (is_real(iso_grid) && ds_exists(iso_grid, ds_type_grid)) ds_grid_destroy(iso_grid);
