var gw = display_get_gui_width();
var gh = display_get_gui_height();

var box_w = gw * 0.80;
var box_h = 150;

var x1 = (gw - box_w) * 0.5;
var y1 = gh - box_h - 40;
var x2 = x1 + box_w;
var y2 = y1 + box_h;


draw_set_alpha(0.78);
draw_set_colour(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_alpha(1);


var pad = 18;
var face_size = 96;
var face_x = x1 + pad;
var face_y = y1 + (box_h - face_size) * 0.5;

if (portrait != noone) {

    var sw = sprite_get_width(portrait);
    var sh = sprite_get_height(portrait);
    var sc = min(face_size / sw, face_size / sh);

    draw_sprite_ext(portrait, 0, face_x, face_y, sc, sc, 0, c_white, 1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);

var text_x = face_x + face_size + 18;
var text_y = y1 + 18;


draw_text(text_x, text_y, lines[line_i]);

draw_set_colour(c_ltgray);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(x2 - 18, y2 - 14, "Press " + chr(global.key_interact) + "...");