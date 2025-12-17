cols = ceil(room_width / 32);
rows = ceil(room_height / 32);
iso_sprite = ds_grid_create(cols, rows); 
ds_grid_clear(iso_sprite, spr_iso_road);
iso_subimg = ds_grid_create(cols, rows); 
ds_grid_clear(iso_subimg, 0);
cursor_x = 0;
cursor_y = 0;
global.zoom      = 1;
global.zoom_min  = 0.5;  
global.zoom_max  = 2.5;  


global.base_view_w = __view_get(e__VW.WView, 0);
global.base_view_h = __view_get(e__VW.HView, 0);
global.game_paused = false;

global.key_up        = ord("W");
global.key_down      = ord("S");
global.key_left      = ord("A");
global.key_right     = ord("D");
global.key_interact  = ord("E");
global.key_pause     = vk_escape;
window_set_size(1280, 720);


window_set_fullscreen(true);