event_inherited();
if (global.game_paused) exit;

var on_road  = place_meeting(x, y, obj_road);
var on_grass = !on_road;

if (on_grass) {
    grass_timer += 1;
    if (grass_timer > room_speed * 2) grass_penalty = true;
} else {
    grass_timer   = 0;
    grass_penalty = false;
}
var spm = (variable_global_exists("car_speed_mult") ? global.car_speed_mult : 1.0);
spm = clamp(spm, 0.6, 1.4);

var cur_max_fwd = max_speed   * spm;
var cur_max_rev = max_reverse * spm;

var cur_accel = accel;
var cur_decel = decel;

if (grass_penalty) {
    cur_max_fwd *= 0.3;
    cur_max_rev *= 0.3;
    
    cur_accel = accel * 0.6;
    cur_decel = decel * 0.4;
}


if (occupied) {

    if (keyboard_check(global.key_up)) {
        speed = clamp(speed + cur_accel, cur_max_rev, cur_max_fwd);
    }
    else if (keyboard_check(global.key_down)) {
        speed = clamp(speed - cur_accel, cur_max_rev, cur_max_fwd);
    }
    else {
        if (abs(speed) < cur_decel) speed = 0;
        else speed -= cur_decel * sign(speed);
    }

   
    if (abs(speed) > 0.1) {
        var mul = 1; 
       

        if (keyboard_check(global.key_left))  direction += turn_speed * mul;
        if (keyboard_check(global.key_right)) direction -= turn_speed * mul;
    }

} else {
    if (abs(speed) < cur_decel) speed = 0;
    else speed -= cur_decel * sign(speed);
}

direction = direction mod 360;


var hsp = lengthdir_x(speed, direction);
var vsp = lengthdir_y(speed, direction);

var nx = x + hsp;
var ny = y + vsp;

var blocked = false;


var b0 = obj_building;
var b1 = obj_hotel;
var b2 = obj_house;


if (!place_meeting(nx, ny, b0) && !place_meeting(nx, ny, b1) && !place_meeting(nx, ny, b2)) {
    x = nx;
    y = ny;
} else {
    blocked = true;

 
    if (!place_meeting(nx, y, b0) && !place_meeting(nx, y, b1) && !place_meeting(nx, y, b2)) {
        x = nx;
    }

  
    if (!place_meeting(x, ny, b0) && !place_meeting(x, ny, b1) && !place_meeting(x, ny, b2)) {
        y = ny;
    }
}


if (blocked) {

    var push = 2;
    x -= lengthdir_x(push, direction);
    y -= lengthdir_y(push, direction);

 
    if (speed > 0) speed = 0;
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
