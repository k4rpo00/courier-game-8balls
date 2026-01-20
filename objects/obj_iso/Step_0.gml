event_inherited();

if (keyboard_check_pressed(global.key_pause)) {
    if (!instance_exists(obj_pause_menu)) {
        instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_pause_menu);
        global.game_paused = true;
    }
}

if (keyboard_check_pressed(ord("M"))) {
    if (!instance_exists(obj_world_map)) {
        instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_world_map);
    } else {
        with (obj_world_map) instance_destroy();
    }
}


scr_apply_zoom();

var target = global.camera_target;
if (instance_exists(target)) {
    var tx = iso_to_scr_x(target.x, target.y);
    var ty = iso_to_scr_y(target.x, target.y);

    var vw = __view_get(e__VW.WView, 0);
    var vh = __view_get(e__VW.HView, 0);

    __view_set(e__VW.XView, 0, tx - vw * 0.5);
    __view_set(e__VW.YView, 0, ty - vh * 0.5);
}

if (mouse_check_button(mb_right)) {
    cursor_x = iso_from_scr_x(mouse_x, mouse_y);
    cursor_y = iso_from_scr_y(mouse_x, mouse_y);
}

var scroll = mouse_wheel_up() - mouse_wheel_down();
if (scroll != 0) {
    var factor = 1.1;
    if (scroll > 0) global.zoom *= factor;
    else            global.zoom /= factor;

    global.zoom = clamp(global.zoom, global.zoom_min, global.zoom_max);
    scr_apply_zoom();
}
