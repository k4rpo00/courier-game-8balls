/*if (!variable_global_exists("cb_mode")) exit;
if (global.cb_mode == 0) exit;

var surf = application_surface;
if (!surface_exists(surf)) exit;

draw_set_alpha(1);
draw_set_colour(c_white);

shader_set(sh_colorblind);
var u = shader_get_uniform(sh_colorblind, "u_mode");
shader_set_uniform_f(u, global.cb_mode);

draw_surface(surf, 0, 0);

shader_reset();

draw_set_alpha(1);
draw_set_colour(c_white);