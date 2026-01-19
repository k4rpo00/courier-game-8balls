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



/// Handle window resizing
var js = (os_browser != browser_not_a_browser);

var ww, wh;
if (js) {
    ww = display_get_width();
    wh = display_get_height();
} else {
    ww = window_get_width();
    wh = window_get_height();
}

var sf = application_surface;

if (!surface_exists(sf)) exit;
if (ww <= 0 || wh <= 0) exit;

var sw = surface_get_width(sf);
var sh = surface_get_height(sf);

if (ww != sw || wh != sh) {

    if (js) {
        window_set_size(ww, wh);
    }

    surface_resize(sf, ww, wh);

    __view_set(e__VW.WView, 0, ww);
    __view_set(e__VW.HView, 0, wh);
    __view_set(e__VW.WPort, 0, ww);
    __view_set(e__VW.HPort, 0, wh);

    __view_set(e__VW.XView, 0, __view_get(e__VW.XView, 0) + ((sw - ww) div 2));
    __view_set(e__VW.YView, 0, __view_get(e__VW.YView, 0) + ((sh - wh) div 2));

    global.base_view_w = ww;
    global.base_view_h = wh;
}
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
    var z;

    if (scroll > 0) {
        z = global.zoom * factor;
        if (z > global.zoom_max) z = global.zoom_max;
    } else {
        z = global.zoom / factor;
        if (z < global.zoom_min) z = global.zoom_min;
    }

    if (z != global.zoom) {
        global.zoom = z;

        var new_w = global.base_view_w / global.zoom;
        var new_h = global.base_view_h / global.zoom;

        __view_set(e__VW.WView, 0, new_w);
        __view_set(e__VW.HView, 0, new_h);
    }
}
