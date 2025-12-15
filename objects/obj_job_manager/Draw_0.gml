if (is_undefined(job) || !job.active) exit;

var sx = iso_to_scr_x(job.tx, job.ty);
var sy = iso_to_scr_y(job.tx, job.ty);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_colour(c_yellow);

//draw_text(sx, sy - 20, "DELIVERY");
//draw_circle(sx, sy - 35, 6, false);