if (keyboard_check_pressed(global.key_interact) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    line_i += 1;

    if (line_i >= array_length(lines)) {
        global.game_paused = false;
        instance_destroy();
    }
}

if (keyboard_check_pressed(vk_escape)) {
    global.game_paused = false;
    instance_destroy();
}
