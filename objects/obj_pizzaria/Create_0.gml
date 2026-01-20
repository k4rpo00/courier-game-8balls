global.game_paused = false;

if (!variable_global_exists("key_up"))       global.key_up       = ord("W");
if (!variable_global_exists("key_down"))     global.key_down     = ord("S");
if (!variable_global_exists("key_left"))     global.key_left     = ord("A");
if (!variable_global_exists("key_right"))    global.key_right    = ord("D");
if (!variable_global_exists("key_interact")) global.key_interact = ord("E");
if (!variable_global_exists("key_pause"))    global.key_pause    = vk_escape;


global.camera_target = noone;
window_set_size(1280, 720);
window_set_fullscreen(true);


if (!variable_global_exists("zoom")) {
    global.zoom      = 1;
    global.zoom_min  = 0.5;
    global.zoom_max  = 2.5;
}



if (!variable_global_exists("base_view_w")) {
    global.base_view_w = __view_get(e__VW.WView, 0);
    global.base_view_h = __view_get(e__VW.HView, 0);
}


if (!instance_exists(obj_postfx)) instance_create_depth(0, 0, -1000, obj_postfx);
if (!instance_exists(obj_hud))    instance_create_depth(0, 0, -999, obj_hud);
    if (!instance_exists(obj_tutorial)) {
    instance_create_depth(0, 0, -1000002, obj_tutorial);
}
global.piz_min_x = 480;
global.piz_max_x = 900;
global.piz_min_y = 240;
global.piz_max_y = 630;
