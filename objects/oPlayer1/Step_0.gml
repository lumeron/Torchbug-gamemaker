// input checks
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_interact = keyboard_check(ord("E"));
key_dropitem = keyboard_check(ord("Q"));

if (keyboard_check(vk_subtract)){ game_restart(); }
if (keyboard_check_pressed(vk_escape)){ game_end(); }


switch (state) {
	case PLAYERSTATE.FREE:
		script_PlayerState_Free();
		break;
	case PLAYERSTATE.INTERACTING:
		script_PlayerState_Interacting();
		break;
	//case PLAYERSTATE.DYING:
	//	invis = true;
	//	script_PlayerState_Dying(sPlayer_dead);
	//	break;
	case PLAYERSTATE.DEAD:
		instance_destroy(self);
		break;
	default:
		break;
}