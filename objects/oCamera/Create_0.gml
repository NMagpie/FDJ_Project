cam = view_camera[0];

follow = oPlayer;

view_w = camera_get_view_width(cam) * 1.5;
view_h = camera_get_view_height(cam) * 1.5;

cam_size = camera_set_view_size(cam, view_w, view_h);

xTo = xstart;
yTo = ystart;

window_set_rectangle(xTo, yTo, 1366, 768);

surface_resize(application_surface, 1366, 768);