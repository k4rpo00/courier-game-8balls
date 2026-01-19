event_inherited();

iso_sprite = spr_bike;
iso_sprite_driver = spr_bike_player;

speed       = 0;
direction   = 0;

accel       = 0.10;
decel       = 0.08;

max_speed   = 1.0;
max_reverse = -1.0;
turn_speed  = 10;

grass_timer   = 0;
grass_penalty = false;

occupied = false;   
driver   = noone;

exit_x = x;
exit_y = y;
show_debug_message("Bike instance: " + string(id));