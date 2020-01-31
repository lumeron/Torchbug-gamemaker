// description of vars
//view_x = camera_get_view_x(view_camera[0]);
//view_y = camera_get_view_y(view_camera[0]);

if (instance_exists(oPlayer1)){
	main_player = oPlayer1;
} else if (instance_exists(oPlayer2)){
	main_player = oPlayer2;
} else {
	game_end();
}

size_w = 512;
size_h = 384;

camera_set_view_target(view_camera[0], main_player)
camera_set_view_size(view_camera[0], size_w, size_h);
camera_set_view_border(view_camera[0], size_w, size_h);

window_set_fullscreen(true);

timer_tick_incrementCheck = 0;