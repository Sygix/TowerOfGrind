function check_proximity_for_chase() {
    if (distance_to_object(obj_player) < chase_range) {
        start_chasing();
    }
}

function flee_from_player() {
    var player_direction = point_direction(x, y, obj_player.x, obj_player.y);
    direction = player_direction + runaway_offset + random(40);

    var move_x = lengthdir_x(move_speed * 1.5, direction);
    var move_y = lengthdir_y(move_speed * 1.5, direction);
    move_with_collision(move_x, move_y);

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
            direction = point_direction(x, y, obj_player.x, obj_player.y);
            var move_x = lengthdir_x(move_speed, direction);
            var move_y = lengthdir_y(move_speed, direction);
            move_with_collision(move_x, move_y);
        
            if (distance_to_object(obj_player) > stop_chase_range) {
                stop_chasing();
            }
            break;
    }
}

function update_animation() {
    if (movement_state == MOVEMENT_STATE.IDLE) {
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