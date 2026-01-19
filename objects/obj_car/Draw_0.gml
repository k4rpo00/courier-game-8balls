var spr_use = (occupied ? iso_sprite_driver : iso_sprite);

var sx = iso_to_scr_x(x, y);
var sy = iso_to_scr_y(x, y);


if (occupied) sy += 6;  

draw_sprite(spr_use, iso_subimg, sx, sy);

if (grass_penalty) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_colour(c_red);
    draw_text(sx, sy - 20, "STAY ON THE ROAD!");
}