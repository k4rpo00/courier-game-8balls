function scr_apply_zoom(){
var js = (os_browser != browser_not_a_browser);

var ww, wh;
if (js) {
    ww = display_get_width();
    wh = display_get_height();
} else {
    ww = window_get_width();
    wh = window_get_height();
}

if (ww <= 0 || wh <= 0) exit;

var sf = application_surface;
if (surface_exists(sf)) {
    var sw = surface_get_width(sf);
    var sh = surface_get_height(sf);
    if (sw != ww || sh != wh) {
        surface_resize(sf, ww, wh);
    }
}

__view_set(e__VW.WPort, 0, ww);
__view_set(e__VW.HPort, 0, wh);


global.base_view_w = ww;
global.base_view_h = wh;

global.zoom = clamp(global.zoom, global.zoom_min, global.zoom_max);
__view_set(e__VW.WView, 0, global.base_view_w / global.zoom);
__view_set(e__VW.HView, 0, global.base_view_h / global.zoom);
}