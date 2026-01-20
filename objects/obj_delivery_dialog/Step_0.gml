if (keyboard_check_pressed(global.key_interact)) {
    line_i++;

    if (line_i >= array_length(lines)) {
        global.game_paused = false;
        instance_destroy();
        exit;
    }
}