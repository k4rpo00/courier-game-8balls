var count =
    instance_number(obj_house) +
    instance_number(obj_building) +
    instance_number(obj_hotel);

if (count <= 0) exit;

var idx = irandom(count - 1);

var target = noone;
var n_house = instance_number(obj_house);
var n_build = instance_number(obj_building);
var n_hotel = instance_number(obj_hotel);

if (idx < n_house) {
    target = instance_find(obj_house, idx);
} else if (idx < n_house + n_build) {
    target = instance_find(obj_building, idx - n_house);
} else {
    target = instance_find(obj_hotel, idx - n_house - n_build);
}

if (target == noone) exit;


var tx = (target.bbox_left + target.bbox_right) * 0.5;
var ty = target.bbox_bottom;


ty += 8;


var tries = 0;
while (tries < 12 &&
       (place_meeting(tx, ty, obj_house) ||
        place_meeting(tx, ty, obj_building) ||
        place_meeting(tx, ty, obj_hotel)))
{
    tries++;


    tx += choose(-8, 8, 0, 0);
    ty += choose(0, 0, -8, 8);
}


if (!variable_global_exists("pickup_x")) global.pickup_x = 0;
if (!variable_global_exists("pickup_y")) global.pickup_y = 0;

var dist = point_distance(global.pickup_x, global.pickup_y, tx, ty);

var base_pay = 10;
var per_unit = 0.03;
var min_pay  = 10;
var max_pay  = 35;

var pay = base_pay + round(dist * per_unit);
pay = clamp(pay, min_pay, max_pay);


job = {
    active: true,
    title: "Deliver Pizza",
    target_id: target,
    tx: tx,
    ty: ty,
    reward: pay,
    step: 1
};
