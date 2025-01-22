if (countdown_active) {
    var elapsed_time = (current_time - start_time) / 1000
    countdown = max(0, countdown_duration - elapsed_time)
    random_set_seed(date_get_second(date_current_datetime()))
    
    if ((round(countdown) % round(doors_closing_interval) == 0) && (round(countdown) != countdown_duration) && (array_length(doors)) > 0) {
        if (!doors_close_this_frame) {
            doors_close_this_frame = true
            var door_to_close = random(array_length(doors))
            doors[door_to_close].animate = true
            array_insert(closed_doors, array_length(closed_doors), doors[door_to_close])
            array_delete(doors, door_to_close, 1)
        }
    } else {
        doors_close_this_frame = false
    }
    
    if (countdown <= 0) {
        game_finish = true
        countdown_active = false
        instance_deactivate_object(obj_player)
    }
}

if (respawn_player) {
    respawn_player = false
    score -= 100
    if (player_life_count > 1) {
        instance_create_layer(player_spawn_point_x, player_spawn_point_y, "Instances", obj_player)
        player_life_count--
    } else {
        game_finish = true
        countdown_active = false
    }
}