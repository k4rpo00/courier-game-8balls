if (!show_text) exit;

var gw = display_get_gui_width();
var gh = display_get_gui_height();


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_text(gw * 0.5, gh * 0.85, text_str);