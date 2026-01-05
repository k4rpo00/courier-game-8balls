
if (keyboard_check_pressed(global.key_pause)) {

    if (instance_exists(obj_settings_menu)) {
        with (obj_settings_menu) instance_destroy();
    }

    if (instance_exists(obj_pause_menu)) {
        global.game_paused = false;
        with (obj_pause_menu) instance_destroy();
    }
    else {
        global.game_paused = true;
        instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_pause_menu);
    }
}
