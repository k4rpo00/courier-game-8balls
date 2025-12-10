// Navigation
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    selected = max(0, selected - 1);
}

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    selected = min(2, selected + 1);
}

// Mouse hover & click
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
                    break; // settings later
                case 2:
                    game_end();
                    break;
            }
        }
    }
}

// Keyboard confirm
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    switch (selected) {
        case 0:
            global.game_paused = false;
            instance_destroy();
            break;

        case 1:
            break;
        case 2:
            game_end();
            break;
    }
}
