if (!show_text || taken) exit;

if (variable_global_exists("game_paused") && global.game_paused) exit;

var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_set_alpha(1);

draw_text(gw * 0.5, gh - 70, "Press " + chr(global.key_interact) + " to pick up pizza");
