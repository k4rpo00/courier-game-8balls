show_text = false;

if (taken) exit;

var p = instance_find(obj_player, 0);
if (p == noone) exit;

if (point_distance(p.x, p.y, x, y) <= pickup_dist) {
    show_text = true;
    sprite_index = spr_hi;

    if (keyboard_check_pressed(global.key_interact)) {
        global.has_pizza = true;

        instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_dialog);

        taken = true;
    }
} else {
    sprite_index = spr_normal;
}
