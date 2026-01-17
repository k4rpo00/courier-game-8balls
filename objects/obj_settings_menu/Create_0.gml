waiting_for = -1;

action_count = 8; 
key_up_temp       = global.key_up;
key_down_temp     = global.key_down;
key_left_temp     = global.key_left;
key_right_temp    = global.key_right;
key_interact_temp = global.key_interact;
key_pause_temp    = global.key_pause;
cb_mode_temp = global.cb_mode;
car_speed_temp    = (variable_global_exists("car_speed_mult") ? global.car_speed_mult : 1.0);
depth = -1000003;