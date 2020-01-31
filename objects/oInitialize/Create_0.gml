/// Game Setup

// roll random
randomize();

//global.current_score = 0;
global.current_oxygen = 200;

// setup playerstate enum
enum PLAYERSTATE {
	FREE,
	INTERACTING,
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



// form tile size
#macro TILE_SIZE 16
#macro S_TILE_MASK_WIDTH 32

// for some reason, sprite_get_width(sTiles_mask) was failing constantly. Had to hard-code the width in.
tiles = sprite_get_width(sTiles_mask) / TILE_SIZE;
tiles = S_TILE_MASK_WIDTH / TILE_SIZE;
heightstoget = tiles * TILE_SIZE;

//// Create Tiles
var layerid = layer_create(0, "Tiles");
tilemapid = layer_tilemap_create(layerid,0,0,tsetCollision,tiles,1);

for (var i = 0; i <= tiles; i++){
	tilemap_set(tilemapid, i, i, 0);
}