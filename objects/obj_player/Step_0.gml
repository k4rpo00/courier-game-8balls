event_inherited();

if (global.game_paused) {
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

   var nx = x + dx;
   var ny = y + dy;


if (!place_meeting(nx, ny, col_obj) && !place_meeting(nx, ny, col_obj1) && !place_meeting(nx, ny, col_obj2)) {
    x = nx;
    y = ny;
}
else {
    
    if (!place_meeting(nx, y, col_obj) && !place_meeting(nx, y, col_obj1) && !place_meeting(nx, y, col_obj2)) {
        x = nx;
    }

   
    if (!place_meeting(x, ny, col_obj) && !place_meeting(x, ny, col_obj1) && !place_meeting(x, ny, col_obj2)) {
        y = ny;
    }
}
    

    if (dx != 0 || dy != 0) {
        

        if (keyboard_check(global.key_up) && !keyboard_check(global.key_down)) {
            facing = 2; 
        }
        else if (keyboard_check(global.key_down) && !keyboard_check(global.key_up)) {
            facing = 0; 
        }
        else if (keyboard_check(global.key_left) && !keyboard_check(global.key_right)) {
            facing = 3; 
        }
        else if (keyboard_check(global.key_right) && !keyboard_check(global.key_left)) {
            facing = 1; 
        }
        
        switch (facing) {
            case 0: sprite_index = spr_player_walk_up;    break;
            case 1: sprite_index = spr_player_walk_right; break;
            case 2: sprite_index = spr_player_walk_down;  break;
            case 3: sprite_index = spr_player_walk_left;  break;
        }

       
        image_speed = 0.25;  

    } else {
       
        image_speed = 0;
        image_index = 0;

      
        switch (facing) {
            case 0: sprite_index = spr_player_walk_up;    break;
            case 1: sprite_index = spr_player_walk_right; break;
            case 2: sprite_index = spr_player_walk_down;  break;
            case 3: sprite_index = spr_player_walk_left;  break;
        }
    }


    var c_hint = instance_nearest(x, y, obj_car);

    if (c_hint != noone && !c_hint.occupied && point_distance(x, y, c_hint.x, c_hint.y) < 64) {
        near_car = c_hint;
    }

   
   if (exit_cooldown <= 0 && keyboard_check_pressed(global.key_interact)) {
    var c = instance_nearest(x, y, obj_car);

    if (c != noone && point_distance(x, y, c.x, c.y) < 64 && !c.occupied) {

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
