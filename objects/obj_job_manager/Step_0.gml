if (is_undefined(job) || !job.active) {
    show_hint = false;
    exit;
}

if (!instance_exists(job.target_id)) {
    job.active = false;
    show_hint = false;
    alarm[0] = room_speed;
    exit;
}

var p = instance_find(obj_player, 0);
if (p == noone) { show_hint = false; exit; }

var px = p.x;
var py = p.y;

if (p.in_car && instance_exists(p.car)) {
    px = p.car.x;
    py = p.car.y;
}

var d = point_distance(px, py, job.tx, job.ty);

var has = (variable_global_exists("has_pizza") && global.has_pizza);

show_hint = (d <= deliver_dist) && has;

if (d < deliver_dist && keyboard_check_pressed(global.key_interact)) {


    if (!variable_global_exists("has_pizza") || !global.has_pizza) exit;

   
    var pick = delivery_pick_customer();


    var dlg = instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_dialog);
    dlg.portrait = pick.portrait;   
    dlg.name_str = pick.name;       
    dlg.lines    = pick.lines;      
    dlg.line_i   = 0;
    dlg.side     = irandom(1);

    global.game_paused = true;

    job.active = false;
    global.has_pizza = false;

    global.money = (variable_global_exists("money") ? global.money : 0) + job.reward;

    alarm[0] = room_speed;
}