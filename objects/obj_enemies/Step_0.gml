if(!instance_exists(obj_player)) {
    stop_chasing();
};
    
switch (movement_state) {
    case MOVEMENT_STATE.RUNNING:
        direction = point_direction(x, y, obj_player.x, obj_player.y);
        var move_x = lengthdir_x(move_speed, direction);
        var move_y = lengthdir_y(move_speed, direction);
        move_with_collision(move_x, move_y);
        break;
    
    case MOVEMENT_STATE.BLOCKED:
        if(is_close_to_player()) {
            resolve_blocked_state();
        } else {
            stop_chasing();
        }
        break;
}

// Mise à jour des animations
update_animation();
