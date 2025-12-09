event_inherited();

if (global.game_paused) {
    image_speed = 0;
    exit;
}

if (!in_car) {

    
    var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

    x += h * walk_speed;
    y += v * walk_speed;

   
    if (h != 0 || v != 0) {
        image_speed = 1;
    } else {
        image_speed = 0;
        image_index = 0;
    }

  
    if (keyboard_check_pressed(ord("E"))) {
        var c = instance_nearest(x, y, obj_car);

 
        if (c != noone && point_distance(x, y, c.x, c.y) < 64 && !c.occupied) {

            in_car = true;
            car    = c;
            visible = false;

           
            c.occupied = true;
            c.driver   = id;

          
            x = c.x;
            y = c.y;

 
            global.camera_target = c;
        }
    }

}

else {
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
