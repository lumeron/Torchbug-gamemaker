/*
	argument0 needs to be the player's sprite
*/


// rotate character sprite based on direction character is facing
if (key_up){
	if (key_right){
		image_angle = 45;
	} else if (key_left) {
		image_angle = 315;
	} else {
		image_angle = 0;
	}
} else if (key_right) {
	image_angle = 90;
} else if (key_left) {
	image_angle = 270;
}
if (key_down) {
	if (key_right){
		image_angle = 135;
	} else if (key_left) {
		image_angle = 225;
	} else {
		image_angle = 180;
	}
} else if (key_right) {
	image_angle = 90;
} else if (key_left) {
	image_angle = 270;
}

// movement calculations
hrzSpd = (key_right - key_left) * walkSpd;
vrtSpd = (key_up - key_down) * walkSpd;

x += hrzSpd;
y += vrtSpd;




if (key_interact) {
	state = PLAYERSTATE.ACTIVATING;
}
if (key_dropitem){
	state = PLAYERSTATE.DROPPING;
}