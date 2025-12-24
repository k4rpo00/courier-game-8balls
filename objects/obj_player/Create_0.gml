event_inherited();

sprite_index = spr_player_walk_down;  
image_speed  = 0;

walk_speed = 1.5;

in_car   = false;
car      = noone;
near_car = noone;     

exit_cooldown = 0;
facing = 2;          

global.camera_target = id;
if (variable_global_exists("next_spawn_x") && global.next_spawn_x != undefined) {
    x = global.next_spawn_x;
    y = global.next_spawn_y;

    global.next_spawn_x = undefined;
    global.next_spawn_y = undefined;
}