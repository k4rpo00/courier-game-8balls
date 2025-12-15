//var gw = display_get_gui_width();
//var gh = display_get_gui_height();

//draw_set_alpha(0.85);
//draw_set_colour(c_black);
//draw_rectangle(0, 0, gw, gh, false);
//draw_set_alpha(1);

//var pad = 40;
//var x1 = pad;
//var y1 = pad;
//var x2 = gw - pad;
//var y2 = gh - pad;

//var pw = x2 - x1;
//var ph = y2 - y1;

//draw_set_alpha(0.95);
//draw_set_colour(make_colour_rgb(20,20,20));
//draw_rectangle(x1, y1, x2, y2, false);
//draw_set_alpha(1);

//var map_w = sprite_get_width(spr_world_map);
//var map_h = sprite_get_height(spr_world_map);

//var scale_x = pw / map_w;
//var scale_y = ph / map_h;

//var sc = min(scale_x, scale_y);

//var draw_w = map_w * sc;
//var draw_h = map_h * sc;

//var mx1 = x1 + (pw - draw_w) * 0.5;
//var my1 = y1 + (ph - draw_h) * 0.5;

//draw_sprite_ext(spr_world_map, 0, mx1, my1, sc, sc, 0, c_white, 1);

//draw_set_colour(c_white);
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_text(x1 + 14, y1 + 12, "MAP (press M to close)");

//var p = instance_find(obj_player, 0);
//if (p != noone) {

 //   var ux = mx1 + (p.x / room_width)  * draw_w;
 //   var uy = my1 + (p.y / room_height) * draw_h;

  //  draw_set_colour(c_white);
   // draw_circle(ux, uy, 6, false);

  //  draw_set_halign(fa_left);
  //  draw_text(ux + 10, uy - 10, "YOU");
//}

//var jm = instance_find(obj_job_manager, 0);
//if (jm != noone && !is_undefined(jm.job) && jm.job.active) {

  //  var dx = mx1 + (jm.job.tx / room_width)  * draw_w;
  //  var dy = my1 + (jm.job.ty / room_height) * draw_h;

   // draw_set_colour(c_yellow);
   // draw_circle(dx, dy, 7, false);

   // draw_set_halign(fa_left);
   // draw_text(dx + 10, dy - 10, "DELIVERY");
//}
