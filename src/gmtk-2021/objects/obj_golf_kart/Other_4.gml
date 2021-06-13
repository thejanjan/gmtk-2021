/// @description Create camera
if room != main_game exit;

// camera_destroy(view_camera[0]);
global.camera_shake = 0;
var v = [1366, 768];
var k = obj_golf_kart;
view_camera[0] = camera_create_view(k.x - (v[0] / 2), k.y - (v[1] / 2), v[0], v[1], 0, k, -1, -1, v[0] / 2, v[1] / 2);