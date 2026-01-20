//if (global.cb_mode == 0) exit;

//var surf = application_surface;
//if (!surface_exists(surf)) exit;

//var gw = display_get_gui_width();
//var gh = display_get_gui_height();

//shader_set(sh_colorblind);
//var u = shader_get_uniform(sh_colorblind, "u_mode");
//shader_set_uniform_f(u, global.cb_mode);


//draw_surface_stretched(surf, 0, 0, gw, gh);

//shader_reset();
/*if (!variable_global_exists("cb_mode")) exit;
if (global.cb_mode == 0) exit;

var surf = application_surface;
if (!surface_exists(surf)) exit;


draw_set_alpha(1);
draw_set_colour(c_white);

shader_set(sh_colorblind);
var u = shader_get_uniform(sh_colorblind, "u_mode");
shader_set_uniform_f(u, global.cb_mode);


draw_surface_stretched(surf, 0, 0, display_get_gui_width(), display_get_gui_height());

shader_reset();

draw_set_alpha(1);
draw_set_colour(c_white);

