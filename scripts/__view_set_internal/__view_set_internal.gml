function __view_set_internal(_prop, _index, _val) {

    switch (_prop) {
        case e__VW.XView: {
            var cam = view_get_camera(_index);
            camera_set_view_pos(cam, _val, camera_get_view_y(cam));
        } break;

        case e__VW.YView: {
            var cam = view_get_camera(_index);
            camera_set_view_pos(cam, camera_get_view_x(cam), _val);
        } break;

        case e__VW.WView: {
            var cam = view_get_camera(_index);
            camera_set_view_size(cam, _val, camera_get_view_height(cam));
        } break;

        case e__VW.HView: {
            var cam = view_get_camera(_index);
            camera_set_view_size(cam, camera_get_view_width(cam), _val);
        } break;

        case e__VW.Angle: {
            var cam = view_get_camera(_index);
            camera_set_view_angle(cam, _val);
        } break;

        case e__VW.HBorder: {
            var cam = view_get_camera(_index);
            camera_set_view_border(cam, _val, camera_get_view_border_y(cam));
        } break;

        case e__VW.VBorder: {
            var cam = view_get_camera(_index);
            camera_set_view_border(cam, camera_get_view_border_x(cam), _val);
        } break;

        case e__VW.HSpeed: {
            var cam = view_get_camera(_index);
            camera_set_view_speed(cam, _val, camera_get_view_speed_y(cam));
        } break;

        case e__VW.VSpeed: {
            var cam = view_get_camera(_index);
            camera_set_view_speed(cam, camera_get_view_speed_x(cam), _val);
        } break;

        case e__VW.Object: {
            var cam = view_get_camera(_index);
            camera_set_view_target(cam, _val);
        } break;

       
        case e__VW.Visible:   view_set_visible(_index, _val); break;
        case e__VW.XPort:     view_set_xport(_index, _val); break;
        case e__VW.YPort:     view_set_yport(_index, _val); break;
        case e__VW.WPort:     view_set_wport(_index, _val); break;
        case e__VW.HPort:     view_set_hport(_index, _val); break;
        case e__VW.Camera:    view_set_camera(_index, _val); break;
        case e__VW.SurfaceID: view_set_surface_id(_index, _val); break;
    }

    return 0;
}
