var count = instance_number(obj_house);
if (count <= 0) exit;

var idx = irandom(count - 1);
var target = instance_find(obj_house, idx);

var offx = 64;
var offy = 32;

var tx = target.x + offx;
var ty = target.y + offy;

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
