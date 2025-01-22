function is_close_to_player() {
    return distance_to_object(obj_player) < chase_range
}

function resolve_blocked_state() {
    direction = point_direction(x, y, obj_player.x, obj_player.y);
    var move_x = lengthdir_x(move_speed, direction);
    var move_y = lengthdir_y(move_speed, direction);
    var future_x = x + move_x;
    var future_y = y + move_y;

    if (!place_meeting(future_x, future_y, obj_player) && !place_meeting(future_x, future_y, tilemap_collision)) {
        start_chasing();
    }
}

function handle_movement() {
    switch (movement_state) {
        case MOVEMENT_STATE.IDLE:
            if(is_close_to_player()) start_chasing();
            break;

        case MOVEMENT_STATE.RUNNING:
            direction = point_direction(x, y, obj_player.x, obj_player.y);
            var move_x = lengthdir_x(move_speed, direction);
            var move_y = lengthdir_y(move_speed, direction);
            move_with_collision(move_x, move_y);
        
            if (distance_to_object(obj_player) > stop_chase_range) {
                stop_chasing();
            }
            break;
        
        case MOVEMENT_STATE.BLOCKED:
            if(is_close_to_player()) {
                resolve_blocked_state();
            } else {
                stop_chasing();
            }
            break;
    }
}

function update_animation() {
    if (movement_state == MOVEMENT_STATE.IDLE || movement_state == MOVEMENT_STATE.BLOCKED) {
        // Idle
        if (direction > 45 && direction <= 135) {
            sprite_index = spr_StickGoblin_Back_Idle;
        } else if (direction > 225 && direction <= 315) {
            sprite_index = spr_StickGoblin_Front_Idle;
        } else {
            sprite_index = spr_StickGoblin_Side_Idle;
            image_xscale = (direction <= 180) ? 1 : -1;
        }
    } else {
        // Moving
        if (direction > 45 && direction <= 135) {
            sprite_index = spr_StickGoblin_Back_Walk;
        } else if (direction > 225 && direction <= 315) {
            sprite_index = spr_StickGoblin_Front_Walk;
        } else {
            sprite_index = spr_StickGoblin_Side_Walk;
            image_xscale = (direction <= 180) ? 1 : -1;
        }
    }
}

//Execution 

handle_movement();
update_animation();