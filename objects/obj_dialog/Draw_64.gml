var gw = display_get_gui_width();
var gh = display_get_gui_height();

if (!is_array(lines)) lines = ["..."];
line_i = clamp(line_i, 0, array_length(lines) - 1);

var box_w = gw * 0.75;
var box_h = 130;

var x1 = (gw - box_w) * 0.5;
var y1 = gh - box_h - 40;
var x2 = x1 + box_w;
var y2 = y1 + box_h;

draw_set_alpha(0.80);
draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_alpha(1);

var pad = 18;
var port_size = 92;

var has_portrait = (portrait != -1) && sprite_exists(portrait);

var text_x = x1 + pad;
if (has_portrait) {
    var px = x1 + pad;
    var py = y1 + (box_h - port_size) * 0.5;


    draw_set_colour(make_colour_rgb(40, 40, 40));
    draw_rectangle(px - 2, py - 2, px + port_size + 2, py + port_size + 2, false);


    draw_sprite_stretched(portrait, 0, px, py, port_size, port_size);

    text_x = px + port_size + 16;
}


draw_set_halign(fa_left);
draw_set_valign(fa_top);

var ty = y1 + 16;

if (is_string(name_str) && name_str != "") {
    draw_set_colour(c_white);
    draw_text(text_x, ty, name_str);
    ty += 28;

    draw_set_colour(c_ltgray);
    draw_text(text_x, ty, lines[line_i]);
} else {
    draw_set_colour(c_white);
    draw_text(text_x, ty + 10, lines[line_i]);
}

draw_set_colour(c_ltgray);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(x2 - 20, y2 - 14, "Press " + chr(global.key_interact) + "...");
