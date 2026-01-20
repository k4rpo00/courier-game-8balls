var gw = display_get_gui_width();
var gh = display_get_gui_height();

if (waiting_for >= 0) {

    draw_set_alpha(0.8);
    draw_set_colour(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_colour(c_white);
    draw_text(gw * 0.5, gh * 0.5 - 20, "Press Any Key");

    draw_set_colour(c_ltgray);
    draw_text(gw * 0.5, gh * 0.5 + 20, "Escape to Cancel");

    exit;
}


draw_set_alpha(0.6);
draw_set_colour(c_black);
draw_rectangle(0, 0, gw, gh, false);
draw_set_alpha(1);

var pw  = gw * 0.8;
var ph  = gh * 0.7;
var px1 = (gw - pw) * 0.5;
var py1 = (gh - ph) * 0.5;
var px2 = px1 + pw;
var py2 = py1 + ph;

draw_set_colour(make_colour_rgb(20, 20, 20));
draw_rectangle(px1, py1, px2, py2, false);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_colour(c_white);
draw_text(px1 + 30, py1 + 20, "Keyboard Controls");

draw_set_colour(c_ltgray);
draw_text(px1 + 30, py1 + 70, "Movement");

var label_x = px1 + 60;
var slot_x1 = px1 + pw * 0.55;
var slot_x2 = slot_x1 + 140;

var row_h   = 50;
var first_y = py1 + 130;

function label_for_index(_i) {
    switch (_i) {
        case 0: return "Move Up";
        case 1: return "Move Down";
        case 2: return "Move Left";
        case 3: return "Move Right";
        case 4: return "Interact";
        case 5: return "Pause";
        case 6: return "Colorblind Mode";
        case 7: return "Car Speed";
        case 8: return "Tutorial";
    }
    return "";
}
function car_speed_name(_m) {
    if (_m <= 0.60) return "Slow";
    if (_m <= 1.05) return "Normal";
    return "Fast";
}
function tut_name(_v) {
    return _v ? "On" : "Off";
}
function temp_key_for_index(_i) {
    switch (_i) {
        case 0: return key_up_temp;
        case 1: return key_down_temp;
        case 2: return key_left_temp;
        case 3: return key_right_temp;
        case 4: return key_interact_temp;
        case 5: return key_pause_temp;
    }
    return 0;
}

function key_to_text(_k) {
    if (_k == vk_escape) return "ESC";
    if (_k == vk_space)  return "Space";
    if (_k == vk_enter)  return "Enter";
    return chr(_k);
}


for (var i = 0; i < action_count; i++) {

    var row_y = first_y + i * row_h;

    draw_set_colour(c_white);
    draw_set_halign(fa_left);
    draw_text(label_x, row_y - 12, label_for_index(i));

    var sy1 = row_y - 18;
    var sy2 = row_y + 18;

    draw_set_colour(make_colour_rgb(60, 60, 60));
    draw_rectangle(slot_x1, sy1, slot_x2, sy2, false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_white);

if (i <= 5) {
    var k = temp_key_for_index(i);
    draw_text((slot_x1 + slot_x2) * 0.5, row_y, key_to_text(k));
}
else if (i == 6) {
    draw_text((slot_x1 + slot_x2) * 0.5, row_y, cb_name(cb_mode_temp));
}
else if (i == 7) {
    draw_text((slot_x1 + slot_x2) * 0.5, row_y, car_speed_name(car_speed_temp));
}
    else if (i == 8) {
    draw_text((slot_x1 + slot_x2) * 0.5, row_y, tut_name(tutorial_temp));
}
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_dkgray);
draw_text(px1 + 30, py2 - 80, "Click a box to change a key. Click Colorblind Mode to cycle.");

var btn_w = 180;
var btn_h = 32;

var save_x1 = px2 - btn_w - 40;
var save_y1 = py2 - btn_h - 40;
var save_x2 = save_x1 + btn_w;
var save_y2 = save_y1 + btn_h;

var back_x1 = px1 + 40;
var back_y1 = py2 - btn_h - 40;
var back_x2 = back_x1 + btn_w;
var back_y2 = back_y1 + btn_h;

draw_set_colour(make_colour_rgb(80, 130, 80));
draw_rectangle(save_x1, save_y1, save_x2, save_y2, false);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_text((save_x1 + save_x2) * 0.5, (save_y1 + save_y2) * 0.5, "Save changes");

draw_set_colour(make_colour_rgb(120, 70, 70));
draw_rectangle(back_x1, back_y1, back_x2, back_y2, false);
draw_set_colour(c_white);
draw_text((back_x1 + back_x2) * 0.5, (back_y1 + back_y2) * 0.5, "Back (discard)");
