if (global.cb_mode == 0) exit;

var surf = application_surface;
if (!surface_exists(surf)) exit;

var gw = display_get_gui_width();
var gh = display_get_gui_height();

shader_set(sh_colorblind);
var u = shader_get_uniform(sh_colorblind, "u_mode");
shader_set_uniform_f(u, global.cb_mode);


draw_surface_stretched(surf, 0, 0, gw, gh);

shader_reset();

