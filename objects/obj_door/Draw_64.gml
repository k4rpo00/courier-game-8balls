draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var k = chr(global.key_interact);
    
if (!is_iso) {

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    draw_set_colour(c_white);
    draw_text(24, gh - 40, "EXIT →");

    if (show_text) {
        draw_set_halign(fa_center);
        draw_text(gw * 0.5, gh - 40, text_str + " (" + k + ")");
    }

    exit;
}

var always_show_world_marker = true;

if (!always_show_world_marker && !show_text) exit;

var sx = iso_to_scr_x(iso_x, iso_y);
var sy = iso_to_scr_y(iso_x, iso_y);

var vx = __view_get(e__VW.XView, 0);
var vy = __view_get(e__VW.YView, 0);
var vw = __view_get(e__VW.WView, 0);
var vh = __view_get(e__VW.HView, 0);

var gw = display_get_gui_width();
var gh = display_get_gui_height();

var gx = (sx - vx) * (gw / vw);
var gy = (sy - vy) * (gh / vh);

draw_set_halign(fa_center);
draw_set_colour(c_yellow);
draw_text(gx, gy - 20, "");

if (show_text) {
    draw_set_colour(c_white);
    draw_text(gx, gy + 5, text_str + " (" + k + ")");
}

