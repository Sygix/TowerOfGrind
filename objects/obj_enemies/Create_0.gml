enum MOVEMENT_STATE {
    IDLE,
    RUNNING,
    RUNNING_AWAY
}

enum ENEMY_STATE {
    SEARCHING,
    CHASING
}

health = 100;
hsp = 0;
vsp = 0;
move_speed = .7;

enemy_state = ENEMY_STATE.SEARCHING;
movement_state = MOVEMENT_STATE.IDLE;

chase_range = 50;
stop_chase_range = 50;
runaway_range = 80;
runaway_offset = 180;

tilemap_collision = layer_tilemap_get_id("Collision");

function start_chasing() {
    enemy_state = ENEMY_STATE.CHASING;
    movement_state = MOVEMENT_STATE.RUNNING;
}

function stop_chasing() {
    enemy_state = ENEMY_STATE.SEARCHING;
    movement_state = MOVEMENT_STATE.IDLE;
}