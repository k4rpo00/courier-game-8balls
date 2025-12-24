global.game_paused = false;


if (!variable_global_exists("key_up"))       global.key_up       = ord("W");
if (!variable_global_exists("key_down"))     global.key_down     = ord("S");
if (!variable_global_exists("key_left"))     global.key_left     = ord("A");
if (!variable_global_exists("key_right"))    global.key_right    = ord("D");
if (!variable_global_exists("key_interact")) global.key_interact = ord("E");
if (!variable_global_exists("key_pause"))    global.key_pause    = vk_escape;


global.camera_target = noone;

global.zoom      = 1;
global.zoom_min  = 0.5;
global.zoom_max  = 2.5;

global.base_view_w = __view_get(e__VW.WView, 0);
global.base_view_h = __view_get(e__VW.HView, 0);
