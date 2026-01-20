if (instance_number(object_index) > 1) 
{ 
    instance_destroy();
     exit; 
}
persistent = true;


depth = 1000000;
application_surface_draw_enable(false);