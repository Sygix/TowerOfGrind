if (countdown_active) {
    var minutes = floor(countdown / 60)
    var seconds = floor(countdown % 60)
    
    var seconds_string = string(seconds)
    if (seconds < 10) {
        seconds_string = "0" + seconds_string
    }
    
    var countdown_text = string(minutes) + ":" + seconds_string
    draw_text(10, 10, "Temps restant: " + string(countdown_text))
}

draw_text(10, camera_get_view_height(camera_get_active()) - 30, "Vie(s): " + string(player_life_count))
draw_text(10, 30, "Score : " + string(score))