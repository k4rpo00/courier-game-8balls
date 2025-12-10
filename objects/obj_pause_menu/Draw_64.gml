if (instance_exists(obj_settings_menu)) {
    exit;
}
var cx = display_get_gui_width() * 0.5;
var cy = display_get_gui_height() * 0.5;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


draw_set_alpha(0.7);
draw_set_colour(c_black);
draw_rectangle(cx - 150, cy - 120, cx + 150, cy + 120, false);
draw_set_alpha(1);


var options = ["Resume", "Settings", "Exit Game"];

for (var i = 0; i < array_length(options); i++) {
    if (i == selected) {
        draw_set_colour(c_grey);
    } else {
        draw_set_colour(c_white);
    }
    draw_text(cx, cy - 40 + i * 40, options[i]);
}
