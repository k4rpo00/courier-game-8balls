event_inherited();

if (variable_global_exists("game_paused") && global.game_paused) {
    image_speed = 0;
    exit;
}

if (exit_cooldown > 0) {
    exit_cooldown -= 1;
}
near_car = noone;

if (!in_car) {

    var dx = 0;
    var dy = 0;

    if (keyboard_check(global.key_up)) {
        dx -= walk_speed;
        dy -= walk_speed;
    }
    if (keyboard_check(global.key_down)) {
        dx += walk_speed;
        dy += walk_speed;
    }
    if (keyboard_check(global.key_left)) {
        dx -= walk_speed;
        dy += walk_speed;
    }
    if (keyboard_check(global.key_right)) {
        dx += walk_speed;
        dy -= walk_speed;
    }

   var col_obj  = obj_building;
   var col_obj1 = obj_hotel;
   var col_obj2 = obj_house; 
   var col_obj3 = obj_counter;
   var col_obj4 = obj_stool;
   var col_obj5 = obj_table1;
   var col_obj6 = obj_wall_left;
   var col_obj7 = obj_wall_right;

var nx = x + dx;
var ny = y + dy;

var hit =
    place_meeting(nx, ny, obj_building) ||
    place_meeting(nx, ny, obj_house)    ||
    place_meeting(nx, ny, obj_hotel)    ||
    counter_feet_hit(nx, ny)            ||
    place_meeting(nx, ny, obj_stool)    ||
    place_meeting(nx, ny, obj_table1)   ||
    place_meeting(nx, ny, obj_wall_left)||
    place_meeting(nx, ny, obj_wall_right);

if (!hit) {
    x = nx;
    y = ny;
} else {

    var hitx =
        place_meeting(nx, y, obj_building) ||
        place_meeting(nx, y, obj_house)    ||
        place_meeting(nx, y, obj_hotel)    ||
        counter_feet_hit(nx, y)            ||  
        place_meeting(nx, y, obj_stool)    ||
        place_meeting(nx, y, obj_table1)   ||
        place_meeting(nx, y, obj_wall_left)||
        place_meeting(nx, y, obj_wall_right);

    if (!hitx) x = nx;

    var hity =
        place_meeting(x, ny, obj_building) ||
        place_meeting(x, ny, obj_house)    ||
        place_meeting(x, ny, obj_hotel)    ||
        counter_feet_hit(x, ny)            ||   
        place_meeting(x, ny, obj_stool)    ||
        place_meeting(x, ny, obj_table1)   ||
        place_meeting(x, ny, obj_wall_left)||
        place_meeting(x, ny, obj_wall_right);

    if (!hity) y = ny;
}
    

var moving = (dx != 0 || dy != 0);

if (moving) {


    if (dx < 0 && dy < 0) facing8 = 7;       
    else if (dx > 0 && dy < 0) facing8 = 1;  
    else if (dx > 0 && dy > 0) facing8 = 3;  
    else if (dx < 0 && dy > 0) facing8 = 5;  
    else if (dy < 0) facing8 = 0;            
    else if (dy > 0) facing8 = 4;            
    else if (dx > 0) facing8 = 2;            
    else if (dx < 0) facing8 = 6;            

    switch (facing8) {
        case 0: sprite_index = spr_p_walk_up;    break;
        case 1: sprite_index = spr_p_walk_ru;    break;
        case 2: sprite_index = spr_p_walk_right; break;
        case 3: sprite_index = spr_p_walk_rd;    break;
        case 4: sprite_index = spr_p_walk_down;  break;
        case 5: sprite_index = spr_p_walk_ld;    break;
        case 6: sprite_index = spr_p_walk_left;  break;
        case 7: sprite_index = spr_p_walk_lu;    break;
    }

    image_speed = 0.25; 

} else {

   
    switch (facing8) {
        case 0: sprite_index = spr_p_walk_up;    break;
        case 1: sprite_index = spr_p_walk_ru;    break;
        case 2: sprite_index = spr_p_walk_right; break;
        case 3: sprite_index = spr_p_walk_rd;    break;
        case 4: sprite_index = spr_p_walk_down;  break;
        case 5: sprite_index = spr_p_walk_ld;    break;
        case 6: sprite_index = spr_p_walk_left;  break;
        case 7: sprite_index = spr_p_walk_lu;    break;
    }

    image_speed = 0;
    image_index = 0; 
}


if (room == rm_test) { 
    x = clamp(x, global.world_min_x, global.world_max_x);
    y = clamp(y, global.world_min_y, global.world_max_y);
}
    if (room == rm_pizzaria) {
    x = clamp(x, global.piz_min_x, global.piz_max_x);
    y = clamp(y, global.piz_min_y, global.piz_max_y);
}
    var c_hint = instance_nearest(x, y, obj_car);

    if (c_hint != noone && !c_hint.occupied && point_distance(x, y, c_hint.x, c_hint.y) < 64) {
        near_car = c_hint;
    }

   
if (exit_cooldown <= 0 && keyboard_check_pressed(global.key_interact)) {
    var c = near_car;

    if (c != noone && !c.occupied) {
        in_car  = true;
        car     = c;
        visible = false;

        c.occupied = true;
        c.driver   = id;

       
        x = c.x;
        y = c.y;

        global.camera_target = c;
    }
}

} else {
   
    if (instance_exists(car)) {
        x = car.x;
        y = car.y;
    } else {
        in_car  = false;
        car     = noone;
        visible = true;
        global.camera_target = id;
    }
}
