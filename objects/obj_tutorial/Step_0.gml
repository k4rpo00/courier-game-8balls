
if (!global.tut_on) exit;
    if (!variable_global_exists("tut_step")) global.tut_step = 0;

if (tut_hide_cd > 0) tut_hide_cd--;

if (global.tut_show && keyboard_check_pressed(vk_space)) {
    global.tut_show = false;
}
function tut_set(_txt) {
    global.tut_text = _txt;
    global.tut_show = true;
    tut_hide_cd = room_speed div 6; 
}


switch (global.tut_step) {


   case 0:
    if (!global.tut_show) {
        tut_set("Tutorial: Go to the pizza box on the counter and press " + chr(global.key_interact) + " to pick it up.");
        global.tut_step = 1;
    }
break;


    case 1:
        if (variable_global_exists("has_pizza") && global.has_pizza) {
            tut_set("Good. Now go to the door and press " + chr(global.key_interact) + " to exit to the city.");
            global.tut_step = 2;
        }
    break;


    case 2:
        if (room == rm_test) {
            tut_set("Great. Your delivery point is marked. Go there and deliver the pizza.");
            global.tut_step = 3;
        }
    break;


case 3:

    
    if (!variable_global_exists("tut_money_base")) {
        global.tut_money_base = (variable_global_exists("money") ? global.money : 0);
    }


    if (variable_global_exists("money") && global.money > global.tut_money_base) {
        tut_set("Delivery complete. Tutorial finished! You can keep working for more deliveries.");
        global.tut_step = 4;
    }

break;


    case 4:
    break;
}
