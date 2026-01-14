var door = noone;
with (obj_door) {
    if (target_room_name == "rm_pizzaria") {
        door = id;
        break;
    }
}
if (door == noone) exit;

var gw = display_get_gui_width();
var gh = display_get_gui_height();

var wx = iso_to_scr_x(door.iso_x, door.iso_y);
var wy = iso_to_scr_y(door.iso_x, door.iso_y);

var vx = __view_get(e__VW.XView, 0);
var vy = __view_get(e__VW.YView, 0);
var vw = __view_get(e__VW.WView, 0);
var vh = __view_get(e__VW.HView, 0);

var gx = (wx - vx) * (gw / vw);
var gy = (wy - vy) * (gh / vh);

var paused = global.game_paused;
var alpha_text = paused ? 0.35 : 1;

var dist  = point_distance(gx, gy, gw * 0.5, gh * 0.5);
var scale = clamp(1.0 - dist / 1800, 0.8, 1.0);


var pad = 40;
var on_screen = (gx >= pad && gx <= gw - pad && gy >= pad && gy <= gh - pad);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha_text);
draw_set_colour(c_yellow);

if (on_screen) {

    draw_text_transformed(gx, gy - 40, "PIZZERIA", scale, scale, 0);
    draw_circle(gx, gy - 18, 10, false);
}
else {
   
    var cx = clamp(gx, pad, gw - pad);
    var cy = clamp(gy, pad, gh - pad);

    draw_text_transformed(cx, cy, "PIZZERIA", scale, scale, 0);

    var ang = point_direction(cx, cy, gx, gy);
    var r = 16;

    draw_triangle(
        cx + lengthdir_x(r, ang),
        cy + lengthdir_y(r, ang),
        cx + lengthdir_x(r, ang + 140),
        cy + lengthdir_y(r, ang + 140),
        cx + lengthdir_x(r, ang - 140),
        cy + lengthdir_y(r, ang - 140),
        false
    );
}

draw_set_alpha(1);
draw_set_colour(c_white);
