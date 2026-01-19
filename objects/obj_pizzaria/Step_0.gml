
if (keyboard_check_pressed(global.key_pause)) {
    if (!instance_exists(obj_pause_menu)) {
        instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_pause_menu);
        global.game_paused = true;
    }
}


var target = global.camera_target;
if (!instance_exists(target)) {
    target = instance_find(obj_player, 0);
    if (target != noone) global.camera_target = target;
}

if (instance_exists(target)) {

    var vw = __view_get(e__VW.WView, 0);
    var vh = __view_get(e__VW.HView, 0);


    __view_set(e__VW.XView, 0, target.x - vw * 0.5);
    __view_set(e__VW.YView, 0, target.y - vh * 0.5);
}
