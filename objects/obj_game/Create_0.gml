application_surface_enable(true);
application_surface_draw_enable(true);
if (!variable_global_exists("game_paused")) global.game_paused = false;

if (!variable_global_exists("key_up"))       global.key_up       = ord("W");
if (!variable_global_exists("key_down"))     global.key_down     = ord("S");
if (!variable_global_exists("key_left"))     global.key_left     = ord("A");
if (!variable_global_exists("key_right"))    global.key_right    = ord("D");
if (!variable_global_exists("key_interact")) global.key_interact = ord("E");
if (!variable_global_exists("key_pause"))    global.key_pause    = vk_escape;

if (file_exists("settings.ini")) {
    ini_open("settings.ini");
    global.key_up       = ini_read_real("keys", "up",       global.key_up);
    global.key_down     = ini_read_real("keys", "down",     global.key_down);
    global.key_left     = ini_read_real("keys", "left",     global.key_left);
    global.key_right    = ini_read_real("keys", "right",    global.key_right);
    global.key_interact = ini_read_real("keys", "interact", global.key_interact);
    global.key_pause    = ini_read_real("keys", "pause",    global.key_pause);
    ini_close();
}
