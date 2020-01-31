timer_tick = round((get_timer() / 1000000));

if (timer_tick_incrementCheck != timer_tick) {
	global.current_oxygen--;
	timer_tick_incrementCheck = timer_tick;
}
