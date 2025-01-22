enum MOVEMENT_STATE {
    IDLE,
    RUNNING,
    BLOCKED
}

enum ENEMY_STATE {
    SEARCHING,
    CHASING
}

health = 100;
move_speed = 0.7;

enemy_state = ENEMY_STATE.SEARCHING;
movement_state = MOVEMENT_STATE.IDLE;

chase_range = 50;
stop_chase_range = 60;
repulsion_distance = 5;

tilemap_collision = layer_tilemap_get_id("Collision");

alarm[0] = 10;

// Fonctions
function start_chasing() {
    enemy_state = ENEMY_STATE.CHASING;
    movement_state = MOVEMENT_STATE.RUNNING;
}

function stop_chasing() {
    enemy_state = ENEMY_STATE.SEARCHING;
    movement_state = MOVEMENT_STATE.IDLE;
}

function is_close_to_player() {
    return distance_to_object(obj_player) < chase_range
}

function move_with_collision(move_x, move_y) {
    var future_x = x + move_x;
    var future_y = y + move_y;
    
    // Collision avec le joueur
    if (place_meeting(future_x, future_y, obj_player)) {
        movement_state = MOVEMENT_STATE.BLOCKED;
        return;
    }
    
    // Collision avec un ennemy
    if (place_meeting(future_x, future_y, obj_enemies)) {
        movement_state = MOVEMENT_STATE.BLOCKED
        return;
    }

    var cell_x = tilemap_get_cell_x_at_pixel(tilemap_collision, future_x, future_y);
    var cell_y = tilemap_get_cell_y_at_pixel(tilemap_collision, future_x, future_y);

    if (tilemap_get(tilemap_collision, cell_x, cell_y) == 0 && !place_meeting(future_x, future_y, tilemap_collision)) { 
        x = future_x;
        y = future_y;
    } else {
        movement_state = MOVEMENT_STATE.BLOCKED;
    }
}

function resolve_blocked_state() {
    direction = point_direction(x, y, obj_player.x, obj_player.y);
    var move_x = lengthdir_x(move_speed, direction);
    var move_y = lengthdir_y(move_speed, direction);
    var future_x = x + move_x;
    var future_y = y + move_y;

    if (
        !place_meeting(future_x, future_y, obj_player) && 
        !place_meeting(future_x, future_y, obj_enemies) && 
        !place_meeting(future_x, future_y, tilemap_collision)
    ) {
        start_chasing();
    }
}

function update_animation() {
    if (movement_state == MOVEMENT_STATE.IDLE || movement_state == MOVEMENT_STATE.BLOCKED) {
        // Animation Idle
        if (direction > 45 && direction <= 135) {
            sprite_index = spr_StickGoblin_Back_Idle;
        } else if (direction > 225 && direction <= 315) {
            sprite_index = spr_StickGoblin_Front_Idle;
        } else {
            sprite_index = spr_StickGoblin_Side_Idle;
            image_xscale = (direction <= 180) ? 1 : -1;
        }
    } else {
        // Animation Walk
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
