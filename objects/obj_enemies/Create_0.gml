enum MOVEMENT_STATE {
    IDLE,
    RUNNING,
    BLOCKED
}

enum ENEMY_STATE {
    SEARCHING,
    CHASING,
    FIGHTING,
}

sprite_fps = 6;
default_image_speed = sprite_get_number(sprite_index) / sprite_fps;
enemy_health = 100;
move_speed = 0.7;
attack_speed = 1.5; //seconds

enemy_state = ENEMY_STATE.SEARCHING;
movement_state = MOVEMENT_STATE.IDLE;

chase_range = 50;
stop_chase_range = 60;
hitbox_range = 16;
kill_score = 15;

tilemap_collision = layer_tilemap_get_id("Collision");

alarm[0] = 10; // Frames number
alarm[1] = attack_speed * game_get_speed(gamespeed_fps);

// Fonctions
function start_chasing() {
    enemy_state = ENEMY_STATE.CHASING;
    movement_state = MOVEMENT_STATE.RUNNING;
}

function stop_chasing() {
    enemy_state = ENEMY_STATE.SEARCHING;
    movement_state = MOVEMENT_STATE.IDLE;
}

function start_fighting() {
    enemy_state = ENEMY_STATE.FIGHTING;
    movement_state = MOVEMENT_STATE.BLOCKED;
}

function stop_fighting() {
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
    
    // Collision avec une porte
    if (place_meeting(future_x, future_y, obj_game.closed_doors)) {
        movement_state = MOVEMENT_STATE.BLOCKED;
        return;
    }
    
    // Collision avec les objets de déco
    if (place_meeting(future_x, future_y, obj_objects)) {
        movement_state = MOVEMENT_STATE.BLOCKED;
        return;
    }

    var cell_x = tilemap_get_cell_x_at_pixel(tilemap_collision, future_x, future_y);
    var cell_y = tilemap_get_cell_y_at_pixel(tilemap_collision, future_x, future_y);

    if (tilemap_get(tilemap_collision, cell_x, cell_y) == 0 && !place_meeting(future_x, future_y, tilemap_collision)) { 
        x = future_x;
        y = future_y;
        return;
    }
    
    movement_state = MOVEMENT_STATE.BLOCKED;
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
        !place_meeting(future_x, future_y, obj_game.doors) &&
        !place_meeting(future_x, future_y, tilemap_collision)
    ) {
        start_chasing();
    }
}

function update_animation() {
    image_speed = default_image_speed;
    if (enemy_state != ENEMY_STATE.FIGHTING && (movement_state == MOVEMENT_STATE.IDLE || movement_state == MOVEMENT_STATE.BLOCKED)) {
        // Animation Idle
        if (direction > 45 && direction <= 135) {
            sprite_index = spr_StickGoblin_Back_Idle;
        } else if (direction > 225 && direction <= 315) {
            sprite_index = spr_StickGoblin_Front_Idle;
        } else {
            sprite_index = spr_StickGoblin_Side_Idle;
            image_xscale = (direction <= 180) ? 1 : -1;
        }
        
        return;
    }
    
    if (enemy_state == ENEMY_STATE.FIGHTING) {
        // Animation Fighting
        if (direction > 45 && direction <= 135) {
            sprite_index = spr_StickGoblin_Back_Attack;
            image_speed = sprite_get_number(sprite_index) / (attack_speed * sprite_fps);
        } else if (direction > 225 && direction <= 315) {
            sprite_index = spr_StickGoblin_Front_Attack;
            image_speed = sprite_get_number(sprite_index) / (attack_speed * sprite_fps);
        } else {
            sprite_index = spr_StickGoblin_Side_Attack;
            image_xscale = (direction <= 180) ? 1 : -1;
            image_speed = sprite_get_number(sprite_index) / (attack_speed * sprite_fps);
        }
        return;
    }
    
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

function spawn_attack_hitbox() {
    show_debug_message("attack")
    direction = point_direction(x, y, obj_player.x, obj_player.y);
    var offset_x = lengthdir_x(sprite_width / 2, direction);
    var offset_y = lengthdir_y(sprite_height / 2, direction);

    var spawn_x = x + offset_x;
    var spawn_y = y + offset_y;

    var hitbox = instance_create_layer(spawn_x, spawn_y, "Instances", obj_attack_hitbox);

    hitbox.creator = object_index;
    hitbox.damage = 10;
    
    audio_play_sound(sd_goblin_attack, 1, false);
}