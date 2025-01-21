
function start_chasing() {
    enemy_state = ENEMY_STATE.CHASING;
    movement_state = MOVEMENT_STATE.RUNNING;
}

function stop_chasing() {
    enemy_state = ENEMY_STATE.SEARCHING;
    movement_state = MOVEMENT_STATE.IDLE;
}

function check_proximity_for_chase() {
    if (distance_to_object(obj_player) < chase_range) {
        start_chasing();
    }
}

function flee_from_player() {
    var player_direction = point_direction(x, y, obj_player.x, obj_player.y);
    direction = player_direction + (runaway_offset + random(40));
    var flee_speed = move_speed * 1.5;
    motion_add(direction, flee_speed);
    
    if (distance_to_object(obj_player) > runaway_range) {
        movement_state = MOVEMENT_STATE.IDLE;
    }
}

function handle_movement() {
    switch (movement_state) {
        case MOVEMENT_STATE.IDLE:
            check_proximity_for_chase();
            break;
            
        case MOVEMENT_STATE.RUNNING:
            move_towards_point(obj_player.x, obj_player.y, move_speed);
            if (distance_to_object(obj_player) > stop_chase_range) {
                stop_chasing();
            }
            break;
            
        case MOVEMENT_STATE.RUNNING_AWAY:
            flee_from_player();
            break;
    }
}

function update_animation() {
    if (hsp == 0 && vsp == 0) {
        image_speed = 0;
    } else {
        image_speed = 2;
    }
}

//Execution 

handle_movement();
update_animation();
