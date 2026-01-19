var gw = display_get_gui_width();
var gh = display_get_gui_height();

var box_w = gw * 0.75;
var box_h = 120;
var x1 = (gw - box_w) * 0.5;
var y1 = gh - box_h - 40;
var x2 = x1 + box_w;
var y2 = y1 + box_h;

draw_set_alpha(0.75);
draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);

draw_text(x1 + 20, y1 + 20, lines[line_i]);

draw_set_colour(c_ltgray);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(x2 - 20, y2 - 16, "Press " + chr(global.key_interact) + "...");
