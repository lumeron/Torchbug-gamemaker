/// Game Setup

// roll random
randomize();

global.current_score = 0;
global.current_oxygen = 200;

// setup playerstate enum
enum PLAYERSTATE {
	FREE,
	ACTIVATING,
	DROPPING,
	DYING,
	DEAD
}
// setup enemystate enum
enum ENEMYSTATE {
	WANDERING,
	HUNTING,
	EATING
}
// setup objectstate enum
enum OBJECTSTATE {
	UNUSED,
	USED
}
