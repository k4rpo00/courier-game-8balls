
if (instance_exists(obj_settings_menu)) {
    exit;
}


if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(global.key_up)) {
    selected = max(0, selected - 1);
}

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(global.key_down)) {
    selected = min(2, selected + 1); 
}


var cx = display_get_gui_width() * 0.5;
var cy = display_get_gui_height() * 0.5;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var option_h = 40;
var start_y = cy - 40;

for (var i = 0; i < 3; i++) {
    var oy = start_y + i * option_h;

    if (my > oy - 20 && my < oy + 20) {
        selected = i;

        if (mouse_check_button_pressed(mb_left)) {
            switch (selected) {
                case 0: 
                    global.game_paused = false;
                    instance_destroy();
                    break;

                case 1: 
                 
                    instance_create_layer(
                        0, 0,
                        "Compatibility_Instances_Depth_0",
                        obj_settings_menu
                    );
                    break;

                case 2: 
                    game_end();
                    break;
            }
        }
    }
}


if (keyboard_check_pressed(vk_enter) ||
    keyboard_check_pressed(vk_space) ||
    keyboard_check_pressed(global.key_interact)) 
{
    switch (selected) {
        case 0: 
            global.game_paused = false;
            instance_destroy();
            break;

        case 1: 
            instance_create_layer(
                0, 0,
                "Compatibility_Instances_Depth_0",
                obj_settings_menu
            );
            break;

        case 2: 
            game_end();
            break;
    }
}

if (keyboard_check_pressed(global.key_pause)) {
    global.game_paused = false;
    instance_destroy();
}
