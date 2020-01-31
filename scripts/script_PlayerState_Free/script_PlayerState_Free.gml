/*
	handling of player while in FREE state
*/

// temp variables
var p1,p2,bbox_side;

// movement calculations
hrzSpd = (key_right - key_left);
vrtSpd = (key_down - key_up);

// neater rotation handling
directionCheck = string(hrzSpd)+","+string(vrtSpd);
switch directionCheck {
	case "-1,-1":
		image_angle = 45;
		break;
	case "-1,0":
		image_angle = 90;
		break;
	case "1,1":
		image_angle = -135;
		break;
	case "0,1":
		image_angle = 180;
		break;
	case "1,0":
		image_angle = -90;
		break;
	case "0,-1":
		image_angle = 0;
		break;
	case "1,-1":
		image_angle = -45;
		break;
	case "-1,1":
		image_angle = 135;
		break;
	default:
		break;
}


// rotate character sprite based on direction character is facing
//if (key_up){
//	if (key_right){
//		image_angle = -45;
//	} else if (key_left) {
//		image_angle = 45;
//	} else {
//		image_angle = 0;
//	}
//} else if (key_right) {
//	image_angle = -90;
//} else if (key_left) {
//	image_angle = 90;
//}
//if (key_down) {
//	if (key_right){
//		image_angle = -135;
//	} else if (key_left) {
//		image_angle = 135;
//	} else {
//		image_angle = 180;
//	}
//} else if (key_right) {
//	image_angle = -90;
//} else if (key_left) {
//	image_angle = 90;
//}

hrzSpd *= walkSpd;
vrtSpd *= walkSpd;

// diagonal corrections
if (hrzSpd > walkSpd){
	hrzSpd = walkSpd;
}
if (vrtSpd > walkSpd){
	vrtSpd = walkSpd;
}

//Store and Remove fractions
//Important: go into collision with whole integers ONLY!
hrzSpd_fraction = hrzSpd - (floor(abs(hrzSpd)) * sign(hrzSpd));
hrzSpd -= hrzSpd_fraction;
vrtSpd_fraction = vrtSpd - (floor(abs(vrtSpd)) * sign(vrtSpd));
vrtSpd -= vrtSpd_fraction;


//tilemap horizontal collision checks
if (hrzSpd > 0)	bbox_side = bbox_right; else bbox_side = bbox_left;
p1 = tilemap_get_at_pixel(global.collisionTileMap,bbox_side+hrzSpd,bbox_top);
p2 = tilemap_get_at_pixel(global.collisionTileMap,bbox_side+hrzSpd,bbox_bottom);
if (tilemap_get_at_pixel(global.collisionTileMap,x,bbox_bottom) > 1) {
	p2 = 0; //ignore bottom side tiles if on a slope
}
if (p1 == 1) || (p2 == 1){
	if (hrzSpd > 0) {
		x = ((x - (x mod TILE_SIZE)) + (TILE_SIZE-1)) - (bbox_right - x);
	} else {
	x = (x - (x mod TILE_SIZE)) - (bbox_left - x);
	}
	hrzSpd = 0;
}
// apply horizontal movement
x += hrzSpd;

//tilemap vertical collision checks
if (tilemap_get_at_pixel(global.collisionTileMap,x,bbox_bottom+vrtSpd) <= 1){
	if (vrtSpd >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	p1 = tilemap_get_at_pixel(global.collisionTileMap,bbox_left,bbox_side+vrtSpd);
	p2 = tilemap_get_at_pixel(global.collisionTileMap,bbox_right,bbox_side+vrtSpd);

	if (p1 == 1) || (p2 == 1){
		if (vrtSpd >= 0) {
			y = ((y - (y mod TILE_SIZE)) + (TILE_SIZE-1)) - (bbox_bottom - y);
		} else {
			y = (y - (y mod TILE_SIZE)) - (bbox_top - y);
		}
		vrtSpd = 0;
	}
}
// apply vertical movement
y += vrtSpd;




if (key_interact) {
	state = PLAYERSTATE.INTERACTING;
}
if (key_dropitem){
	state = PLAYERSTATE.DROPPING;
}