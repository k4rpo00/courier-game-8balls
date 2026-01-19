function __init_global() {
	gml_pragma( "global", "__init_global();");


	layer_force_draw_depth(true,0);		
	draw_set_colour( c_black );

global.game_paused = false;
global.tut_on   = false;
global.tut_step = 0;
global.tut_show = false;
global.tut_text = "";

global.cb_mode = 0; 
global.car_speed_mult = 1.0;

ini_open("settings.ini");
global.cb_mode = ini_read_real("accessibility", "colorblind_mode", global.cb_mode); 
global.tut_on = (ini_read_real("tutorial", "enabled", 0) == 1);
global.car_speed_mult = ini_read_real("gameplay", "car_speed_mult", global.car_speed_mult);
ini_close();
global.car_speed_mult = clamp(global.car_speed_mult, 0.6, 1.4);
}
