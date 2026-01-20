var margin  = 20;
var panel_w = 520;   
var panel_h = 170;

var x1 = margin;
var y1 = margin;
var x2 = x1 + panel_w;
var y2 = y1 + panel_h;

draw_set_alpha(0.92);
draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_alpha(1);

var pad = 18;
var line = 26;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_colour(c_white);
draw_text(x1 + pad, y1 + 10, "TASK");

draw_set_colour(c_gray);
draw_line(x1 + pad, y1 + 40, x2 - pad, y1 + 40);

var yy = y1 + 52;

if (is_undefined(job) || !job.active) {

    draw_set_colour(c_ltgray);
    draw_text(x1 + pad, yy, "No active deliveries");

} else {

    draw_set_colour(c_white);
    draw_text(x1 + pad, yy, "Deliver Pizza");
    yy += line;

    draw_set_colour(c_ltgray);
    draw_text(x1 + pad, yy, "Go to the marked delivery point");
    yy += line;

    draw_set_colour(c_ltgray);
    draw_text(x1 + pad, yy, "Press " + chr(global.key_interact) + " to deliver");
    yy += line;

    draw_set_colour(c_yellow);
    draw_text(x1 + pad, yy, "Reward: $" + string(job.reward));
}


if (!variable_global_exists("money")) global.money = 0;

var mw = 160;
var mh = 40;

var mx2 = display_get_gui_width() - margin;
var mx1 = mx2 - mw;
var my1 = margin;
var my2 = my1 + mh;

draw_set_alpha(0.85);
draw_set_colour(c_black);
draw_rectangle(mx1, my1, mx2, my2, false);
draw_set_alpha(1);

draw_set_colour(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

draw_text(mx2 - 14, (my1 + my2) * 0.5, "$ " + string(global.money));

if (!is_undefined(job) && job.active) {

    var wx = iso_to_scr_x(job.tx, job.ty);
    var wy = iso_to_scr_y(job.tx, job.ty);

    var vx = __view_get(e__VW.XView, 0);
    var vy = __view_get(e__VW.YView, 0);
    var vw = __view_get(e__VW.WView, 0);
    var vh = __view_get(e__VW.HView, 0);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    var sx = (wx - vx) * (gw / vw);
    var sy = (wy - vy) * (gh / vh);

    var lift_text = 80;  
    var lift_ring = 50;

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);


    draw_set_colour(c_yellow);
    draw_text(sx, sy - lift_text, "DELIVERY");

    draw_set_colour(c_yellow);
    draw_circle(sx, sy - lift_ring, 14, false);
    
    var arr = 40;


if (sx < 0 || sx > gw || sy < 0 || sy > gh) {

    var cx = clamp(sx, pad, gw - arr);
    var cy = clamp(sy, pad, gh - arr);

  
    var ang = point_direction(cx, cy, sx, sy);

    var r  = 16;
    var x1 = cx + lengthdir_x(r, ang);
    var y1 = cy + lengthdir_y(r, ang);

    var x2 = cx + lengthdir_x(r, ang + 140);
    var y2 = cy + lengthdir_y(r, ang + 140);

    var x3 = cx + lengthdir_x(r, ang - 140);
    var y3 = cy + lengthdir_y(r, ang - 140);

    draw_set_colour(c_yellow);
    draw_triangle(x1, y1, x2, y2, x3, y3, false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx, cy - 22, "DELIVERY");
}

}




