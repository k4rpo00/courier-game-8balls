
if (keyboard_check_pressed(vk_up)) {
    selected = max(0, selected - 1);
}
if (keyboard_check_pressed(vk_down)) {
    selected = min(2, selected + 1);
}


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
