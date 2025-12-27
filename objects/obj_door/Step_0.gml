show_text = false;

var p = instance_find(obj_player, 0);
if (p == noone) exit;

var dx, dy;

if (is_iso) {
    dx = p.x - iso_x;
    dy = p.y - iso_y;
} else {
    dx = p.x - x;
    dy = p.y - y;
}

if (sqrt(dx*dx + dy*dy) < 48) {
    show_text = true;

    if (keyboard_check_pressed(global.key_interact)) {

    
        var rid = asset_get_index(target_room_name);
        if (rid < 0) {
            show_debug_message("Door ERROR: target_room_name not found: " + target_room_name);
            exit;
        }

        global.next_spawn_x = target_x;
        global.next_spawn_y = target_y;
      room_goto(asset_get_index(target_room_name));
    }
}
