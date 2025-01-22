if (countdown_active) {
    var elapsed_time = (current_time - start_time) / 1000
    countdown = max(0, countdown_duration - elapsed_time)
    random_set_seed(date_get_second(date_current_datetime()))
    
    if ((round(countdown) % doors_closing_interval == 0) && (round(countdown) != countdown_duration)) {
        if (!doors_close_this_frame) {
            doors_close_this_frame = true
            var door_to_close = random(array_length(doors))
            doors[door_to_close].animate = true
            array_delete(doors, door_to_close, 1)
        }
    } else {
        doors_close_this_frame = false
    }
    
    if (countdown <= 0) {
        countdown_active = false
        game_end()
        //room_goto()
    }
}