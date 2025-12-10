if (near_car != noone) {
    var sx = iso_to_scr_x(near_car.x, near_car.y);
    var sy = iso_to_scr_y(near_car.x, near_car.y);

    var vx = __view_get(e__VW.XView, 0);
    var vy = __view_get(e__VW.YView, 0);

    sx -= vx;
    sy -= vy;

    var key_char = chr(global.key_interact);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_white);
    draw_set_alpha(1);

    draw_text(sx, sy - 40, "Press " + key_char + " to enter");
}
