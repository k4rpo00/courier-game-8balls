event_inherited();
iso_sprite = spr_iso_road;
var f = 0;
if (place_meeting(x + 32, y, obj_road)) f += 1;
if (place_meeting(x, y - 32, obj_road)) f += 2;
if (place_meeting(x - 32, y, obj_road)) f += 4;
if (place_meeting(x, y + 32, obj_road)) f += 8;
iso_subimg = f;

