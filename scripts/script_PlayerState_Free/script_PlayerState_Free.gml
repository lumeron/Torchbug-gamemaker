/*
	handling of player while in FREE state
*/

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

// apply movement
x += hrzSpd;
y += vrtSpd;




if (key_interact) {
	state = PLAYERSTATE.INTERACTING;
}
if (key_dropitem){
	state = PLAYERSTATE.DROPPING;
}