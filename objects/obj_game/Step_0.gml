if (countdown_active) {
    var elapsed_time = (current_time - start_time) / 1000
    countdown = max(0, countdown_duration - elapsed_time)
    
    if (countdown <= 0) {
        countdown_active = false
        game_end()
        //room_goto()
    }
}