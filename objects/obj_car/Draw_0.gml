event_inherited();

if (grass_penalty) {
    var sx = iso_to_scr_x(x, y);
    var sy = iso_to_scr_y(x, y) - 20;

    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_colour(c_red);

    draw_text(sx, sy, "STAY ON THE ROAD!");
}