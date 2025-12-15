if (!is_undefined(job) && job.active) {
  
    if (!instance_exists(job.target_id)) {
        job.active = false;
        alarm[0] = room_speed;
        exit;
    }

   
    var p = instance_find(obj_player, 0);
    if (p != noone && !p.in_car) {
        var d = point_distance(p.x, p.y, job.tx, job.ty);
if (d < 48 && keyboard_check_pressed(global.key_interact)) {
    job.active = false;

    global.money = (variable_global_exists("money") ? global.money : 0) + job.reward;

    alarm[0] = room_speed;
}
    }
}
