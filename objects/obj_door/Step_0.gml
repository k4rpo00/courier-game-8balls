show_text = false;

var p = instance_find(obj_player, 0);
if (p == noone) exit;

if (point_distance(p.x, p.y, x, y) < 48) {
    show_text = true;

    if (keyboard_check_pressed(global.key_interact)) {

     
        if (target_room < 0) {
            target_room = asset_get_index(target_room_name);
        }

      
        if (target_room < 0) {
            show_debug_message("Door ERROR: target_room_name not found: " + target_room_name);
            exit;
        }

        global.next_spawn_x = target_x;
        global.next_spawn_y = target_y;

        room_goto(target_room);
    }
}
