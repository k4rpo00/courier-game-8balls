event_inherited();
if (occupied && instance_exists(driver)) {

   
    var rider_sprite;
    var rider_frame = 0;

  
    var dir4 = floor(iso_subimg / 2); 

    switch (dir4) {
        case 0: rider_sprite = spr_player_walk_up;    break;
        case 1: rider_sprite = spr_player_walk_right; break;
        case 2: rider_sprite = spr_player_walk_down;  break;
        case 3: rider_sprite = spr_player_walk_left;  break;
    }

    
    var rx = iso_to_scr_x(x, y);
    var ry = iso_to_scr_y(x, y);

    var offx = 0;
    var offy = -10;

    draw_sprite(rider_sprite, rider_frame, rx + offx, ry + offy);
}

if (grass_penalty) {
    var sx = iso_to_scr_x(x, y);
    var sy = iso_to_scr_y(x, y) - 20;

    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_colour(c_red);

    draw_text(sx, sy, "STAY ON THE ROAD!");
}