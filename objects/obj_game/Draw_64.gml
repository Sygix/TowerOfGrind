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