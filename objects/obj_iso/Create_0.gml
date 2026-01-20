event_inherited();

iso_grid = -1;

application_surface_enable(true);
application_surface_draw_enable(true);

cols = ceil(room_width / 32);
rows = ceil(room_height / 32);

iso_sprite = ds_grid_create(cols, rows);
ds_grid_clear(iso_sprite, spr_iso_road);

iso_subimg = ds_grid_create(cols, rows);
ds_grid_clear(iso_subimg, 0);

cursor_x = 0;
cursor_y = 0;
window_set_size(1280, 720);
window_set_fullscreen(true);

if (!variable_global_exists("pizza_count")) global.pizza_count = 0;

if (!variable_global_exists("zoom")) {
    global.zoom      = 1;
    global.zoom_min  = 0.5;
    global.zoom_max  = 2.5;
} else {
    if (!variable_global_exists("zoom_min")) global.zoom_min = 0.5;
    if (!variable_global_exists("zoom_max")) global.zoom_max = 2.5;
}

if (!variable_global_exists("game_paused")) global.game_paused = false;

if (!variable_global_exists("key_up"))       global.key_up       = ord("W");
if (!variable_global_exists("key_down"))     global.key_down     = ord("S");
if (!variable_global_exists("key_left"))     global.key_left     = ord("A");
if (!variable_global_exists("key_right"))    global.key_right    = ord("D");
if (!variable_global_exists("key_interact")) global.key_interact = ord("E");
if (!variable_global_exists("key_pause"))    global.key_pause    = vk_escape;

if (!variable_global_exists("cb_mode")) {
    global.cb_mode = 0;
    ini_open("settings.ini");
    global.cb_mode = ini_read_real("accessibility", "cb_mode", global.cb_mode);
    ini_close();
}


global.world_min_x = 0;
global.world_min_y = 0;
global.world_max_x = cols * 32 - 1;
global.world_max_y = rows * 32 - 1;

scr_apply_zoom();

if (!instance_exists(obj_tutorial)) {
    instance_create_depth(0, 0, -1000002, obj_tutorial);
}