enum MOVEMENT_STATE {
    IDLE,
    RUNNING
}

enum ENEMY_STATE {
    SEARCHING,
    CHASING
}

health = 100;
move_speed = .7;

enemy_state = ENEMY_STATE.SEARCHING;
movement_state = MOVEMENT_STATE.IDLE;

chase_range = 50;
stop_chase_range = 60;

tilemap_collision = layer_tilemap_get_id("Collision");

function start_chasing() {
    enemy_state = ENEMY_STATE.CHASING;
    movement_state = MOVEMENT_STATE.RUNNING;
}

function stop_chasing() {
    enemy_state = ENEMY_STATE.SEARCHING;
    movement_state = MOVEMENT_STATE.IDLE;
}

function move_with_collision(move_x, move_y) {
    var future_x = x + move_x;
    var future_y = y + move_y;

    var cell_x = tilemap_get_cell_x_at_pixel(tilemap_collision, future_x, future_y);
    var cell_y = tilemap_get_cell_y_at_pixel(tilemap_collision, future_x, future_y);

    if (tilemap_get(tilemap_collision, cell_x, cell_y) == 0) { // 0 = Pas d'obstacle
        x = future_x;
        y = future_y;
    }
}