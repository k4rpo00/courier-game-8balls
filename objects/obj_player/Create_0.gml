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

var hit =
    counter_feet_hit(x, y) ||
    place_meeting(x, y, obj_table1) ||
    place_meeting(x, y, obj_stool) ||
    place_meeting(x, y, obj_wall_left) ||
    place_meeting(x, y, obj_wall_right);

if (room == rm_test) {
    hit = hit
        || place_meeting(x, y, obj_building)
        || place_meeting(x, y, obj_house)
        || place_meeting(x, y, obj_hotel);
}

if (hit) {
    for (var i = 0; i < tries; i++) {
        var ang = irandom(359);
        var tx = x + lengthdir_x(8, ang);
        var ty = y + lengthdir_y(8, ang);

        var free =
            !counter_feet_hit(tx, ty) &&
            !place_meeting(tx, ty, obj_table1) &&
            !place_meeting(tx, ty, obj_stool) &&
            !place_meeting(tx, ty, obj_wall_left) &&
            !place_meeting(tx, ty, obj_wall_right);

        if (room == rm_test) {
            free = free
                && !place_meeting(tx, ty, obj_building)
                && !place_meeting(tx, ty, obj_house)
                && !place_meeting(tx, ty, obj_hotel);
        }

        if (free) { x = tx; y = ty; break; }
    }
}
