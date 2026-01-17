var sx = iso_to_scr_x(x, y);
var sy = iso_to_scr_y(x, y);

draw_sprite_ext(
    sprite_index,
    image_index,
    round(sx),
    round(sy),  
    image_xscale,
    image_yscale,
    image_angle,
    image_blend,
    image_alpha
);