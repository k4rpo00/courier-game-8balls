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

var tries = 60;
if (place_meeting(x, y, obj_building) || place_meeting(x, y, obj_house) || place_meeting(x, y, obj_hotel)) {

    for (var i = 0; i < tries; i++) {
        var ang = irandom(359);
        var tx = x + lengthdir_x(8, ang);
        var ty = y + lengthdir_y(8, ang);

        if (!place_meeting(tx, ty, obj_building)
        &&  !place_meeting(tx, ty, obj_house)
        &&  !place_meeting(tx, ty, obj_hotel)) {
            x = tx;
            y = ty;
            break;
        }
    }
}