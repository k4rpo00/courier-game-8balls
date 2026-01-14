function __init_global() {
	gml_pragma( "global", "__init_global();");

	// set any global defaults
	layer_force_draw_depth(true,0);		// force all layers to draw at depth 0
	draw_set_colour( c_black );

global.game_paused = false;


global.cb_mode = 0;

ini_open("settings.ini");
global.cb_mode = ini_read_real("accessibility", "colorblind_mode", global.cb_mode);
ini_close();
}
