var gw = display_get_gui_width();
var gh = display_get_gui_height();

var pw  = gw * 0.8;
var ph  = gh * 0.7;
var px1 = (gw - pw) * 0.5;
var py1 = (gh - ph) * 0.5;
var px2 = px1 + pw;
var py2 = py1 + ph;

var label_x = px1 + 80;
var slot_x1 = px1 + pw * 0.55;
var slot_x2 = slot_x1 + 140;

var row_h   = 50;
var first_y = py1 + 130;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (waiting_for >= 0) {

    var key = keyboard_lastkey;

    if (key != 0) {
    
        if (key != vk_escape) {
            switch (waiting_for) {
                case 0: key_up_temp       = key; break;
                case 1: key_down_temp     = key; break;
                case 2: key_left_temp     = key; break;
                case 3: key_right_temp    = key; break;
                case 4: key_interact_temp = key; break;
                case 5: key_pause_temp    = key; break;
                   
            }
        }
       
        waiting_for = -1;
    }


    exit;
}

if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(global.key_pause)) {
    instance_destroy();
    exit;
}

for (var i = 0; i < action_count; i++) {
    var row_y = first_y + i * row_h;
    var sy1   = row_y - 18;
    var sy2   = row_y + 18;

 if (mx > slot_x1 && mx < slot_x2 && my > sy1 && my < sy2) {
    if (mouse_check_button_pressed(mb_left)) {

        if (i <= 5) {
            waiting_for = i;
            keyboard_lastkey = 0;
        }
        else if (i == 6) {
            cb_mode_temp = (cb_mode_temp + 1) mod 4;
        }
        else if (i == 7) {
            if (car_speed_temp <= 0.61) car_speed_temp = 1.0;
            else if (car_speed_temp <= 1.01) car_speed_temp = 1.4;
            else car_speed_temp = 0.6;
        }
        else if (i == 8) {
    tutorial_temp = !tutorial_temp;
}
    }
}
}
        


var btn_w = 180;
var btn_h = 32;

var save_x1 = px2 - btn_w - 40;
var save_x2 = save_x1 + btn_w;
var save_y1 = py2 - btn_h - 40;
var save_y2 = save_y1 + btn_h;

var back_x1 = px1 + 40;
var back_x2 = back_x1 + btn_w;
var back_y1 = py2 - btn_h - 40;
var back_y2 = back_y1 + btn_h;

if (mx > save_x1 && mx < save_x2 && my > save_y1 && my < save_y2) {
    if (mouse_check_button_pressed(mb_left)) {

    
        global.key_up       = key_up_temp;
        global.key_down     = key_down_temp;
        global.key_left     = key_left_temp;
        global.key_right    = key_right_temp;
        global.key_interact = key_interact_temp;
        global.key_pause    = key_pause_temp;
        global.cb_mode      = cb_mode_temp;
        global.car_speed_mult = car_speed_temp;
        global.tut_on = tutorial_temp;
        if (global.tut_on) {
    global.tut_step = 0;
    global.tut_show = false;
    global.tut_text = "";

    global.tut_money_base = undefined; 
}
    
        ini_open("settings.ini");
        ini_write_real("keys", "up",       global.key_up);
        ini_write_real("keys", "down",     global.key_down);
        ini_write_real("keys", "left",     global.key_left);
        ini_write_real("keys", "right",    global.key_right);
        ini_write_real("keys", "interact", global.key_interact);
        ini_write_real("keys", "pause",    global.key_pause);
        ini_write_real("accessibility", "cb_mode", global.cb_mode); 
        ini_write_real("gameplay", "car_speed_mult", global.car_speed_mult);
        ini_write_real("tutorial", "enabled", global.tut_on ? 1 : 0);
        
        ini_close();
        instance_destroy();
        exit;
    }
}

if (mx > back_x1 && mx < back_x2 && my > back_y1 && my < back_y2) {
    if (mouse_check_button_pressed(mb_left)) {
        instance_destroy();
        exit;
    }
}
var cb_row_y = first_y + 6 * row_h;
var cb_sy1 = cb_row_y - 18;
var cb_sy2 = cb_row_y + 18;

if (mx > slot_x1 && mx < slot_x2 && my > cb_sy1 && my < cb_sy2) {
    if (keyboard_check_pressed(vk_left))  cb_mode_temp = (cb_mode_temp + 3) mod 4;
    if (keyboard_check_pressed(vk_right)) cb_mode_temp = (cb_mode_temp + 1) mod 4;
}
var sp_row_y = first_y + 7 * row_h;
var sp_sy1 = sp_row_y - 18;
var sp_sy2 = sp_row_y + 18;

if (mx > slot_x1 && mx < slot_x2 && my > sp_sy1 && my < sp_sy2) {
    if (keyboard_check_pressed(vk_left)) {
        if (car_speed_temp <= 0.61) car_speed_temp = 1.4;
        else if (car_speed_temp <= 1.01) car_speed_temp = 0.6;
        else car_speed_temp = 1.0;
    }
    if (keyboard_check_pressed(vk_right)) {
        if (car_speed_temp <= 0.61) car_speed_temp = 1.0;
        else if (car_speed_temp <= 1.01) car_speed_temp = 1.4;
        else car_speed_temp = 0.6;
    }
}
