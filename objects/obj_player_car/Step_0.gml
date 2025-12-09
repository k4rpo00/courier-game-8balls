
if (keyboard_check(ord("A"))) {
    move_dir -= 45; 
}
if (keyboard_check(ord("D"))) {
    move_dir += 45;
}


if (keyboard_check(ord("W"))) {
  
    move_speed = clamp(move_speed + accel, max_reverse, max_speed);
}
else if (keyboard_check(ord("S"))) {
   
    move_speed = clamp(move_speed - accel, max_reverse, max_speed);
}
else {
    
    if (abs(move_speed) < decel) {
        move_speed = 0;
    } else {
        move_speed -= decel * sign(move_speed);
    }
}


var hsp = lengthdir_x(move_speed, move_dir);
var vsp = lengthdir_y(move_speed, move_dir);


if (place_meeting(x + hsp, y, obj_wall)) {
   
    while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = 0; 
}
x += hsp;


if (place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
    }
    vsp = 0; 
}
y += vsp;


image_angle = move_dir;


if (direction >= 360) direction -= 360;
if (direction < 0)    direction += 360;

iso_subimg = round(direction / 360 * sprite_get_number(iso_sprite));
