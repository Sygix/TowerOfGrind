if (enemy_state == ENEMY_STATE.SEARCHING && distance_to_object(obj_player) < chase_range) {
    start_chasing();
} else if (enemy_state == ENEMY_STATE.CHASING && distance_to_object(obj_player) > stop_chase_range) {
    stop_chasing();
} else if (enemy_state == ENEMY_STATE.FIGHTING && distance_to_object(obj_player) > hitbox_range) {
    stop_fighting();
}

// Redémarrage de l'alarme
alarm[0] = 10;
