function counter_feet_hit(_x, _y) {
    var c = instance_place(_x, _y, obj_counter);
    if (c == noone) return false;



    var left   = c.x - c.solid_w * 0.5;
    var right  = c.x + c.solid_w * 0.5;
    var top    = c.y + c.solid_yoff - c.solid_h * 0.5;
    var bottom = c.y + c.solid_yoff + c.solid_h * 0.5;

    return (_x >= left && _x <= right && _y >= top && _y <= bottom);
}