if (keyboard_check_pressed(global.key_pause)) {
    global.game_paused = !global.game_paused;
}

var target = global.camera_target;
if (!instance_exists(target)) {
    target = instance_find(obj_player, 0);
    if (target != noone) global.camera_target = target;
}

if (instance_exists(target)) {
    var tx = iso_to_scr_x(target.x, target.y);
    var ty = iso_to_scr_y(target.x, target.y);

    var vw = __view_get(e__VW.WView, 0);
    var vh = __view_get(e__VW.HView, 0);

    __view_set(e__VW.XView, 0, tx - vw * 0.5);
    __view_set(e__VW.YView, 0, ty - vh * 0.5);
}
