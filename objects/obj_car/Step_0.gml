event_inherited();
if (global.game_paused) {
    exit;
}

var on_road  = place_meeting(x, y, obj_road);
var on_grass = !on_road;

if (on_grass) {
    grass_timer += 1;
    if (grass_timer > room_speed * 2) {
        grass_penalty = true;
    }
} else {
    grass_timer   = 0;
    grass_penalty = false;
}

var cur_max_speed = max_speed;
if (grass_penalty) {
    cur_max_speed = max_speed * 0.3;   
}

if (occupied) {

    
    if (keyboard_check(global.key_up)) {
        speed = clamp(speed + accel, max_reverse, cur_max_speed);
    }
    else if (keyboard_check(global.key_down)) {
        speed = clamp(speed - accel, max_reverse, cur_max_speed);
    }
    else {
        if (abs(speed) < decel)
            speed = 0;
        else
            speed -= decel * sign(speed);
    }

  
    if (abs(speed) > 0.1) {
        if (keyboard_check(global.key_left)) {
            direction += turn_speed;
        }
        if (keyboard_check(global.key_right)) {
            direction -= turn_speed;
        }
    }

} else {
    if (speed != 0) {
        if (abs(speed) < decel)
            speed = 0;
        else
            speed -= decel * sign(speed);
    }
}


direction = direction mod 360;

var col_obj  = obj_building;
var col_obj1 = obj_hotel;
var col_obj2 = obj_house;

var hsp = lengthdir_x(speed, direction);
var vsp = lengthdir_y(speed, direction);

var nx = x + hsp;
var ny = y + vsp;

var blocked = false;

if (!place_meeting(nx, ny, col_obj)) {
    x = nx;
    y = ny;
} else {
    blocked = true;

    if (!place_meeting(nx, y, col_obj)) {
        x = nx;
    }

    if (!place_meeting(x, ny, col_obj)) {
        y = ny;
    }
}

if (!place_meeting(nx, ny, col_obj1)) {
    x = nx;
    y = ny;
} else {
    blocked = true;

    if (!place_meeting(nx, y, col_obj1)) {
        x = nx;
    }

    if (!place_meeting(x, ny, col_obj1)) {
        y = ny;
    }
}

if (!place_meeting(nx, ny, col_obj2)) {
    x = nx;
    y = ny;
} else {
    blocked = true;

    if (!place_meeting(nx, y, col_obj2)) {
        x = nx;
    }

    if (!place_meeting(x, ny, col_obj2)) {
        y = ny;
    }
}

if (blocked && speed > 0) {
    speed = 0;
}


iso_subimg = round(direction / 360 * sprite_get_number(iso_sprite));



if (occupied && keyboard_check_pressed(global.key_interact)) {

    var p = driver; 

    if (instance_exists(p)) {
        with (p) {
          
            x = other.x;
            y = other.y + 16;

            visible = true;
            in_car  = false;
            car     = noone;

          exit_cooldown = room_speed div 4;
            global.camera_target = id;
        }
    }

    driver   = noone;
    occupied = false;
}