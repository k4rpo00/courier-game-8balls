function __init_view() {

    if (variable_global_exists("__vw_inited") && global.__vw_inited) return;
    global.__vw_inited = true;
}
enum e__VW {
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID,
}