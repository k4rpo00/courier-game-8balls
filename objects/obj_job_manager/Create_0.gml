job = undefined;


show_tasks = true;
global.pickup_x = 0;
global.pickup_y = 0;


alarm[0] = room_speed;
if (instance_number(obj_job_manager) > 1) {
    instance_destroy();
    exit;
}
