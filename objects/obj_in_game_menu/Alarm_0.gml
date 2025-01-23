minutes = floor(obj_game.countdown / 60)
seconds = floor(obj_game.countdown % 60)
if (seconds < 10) {
    seconds = "0" + string(seconds)
}
stat[0] = "Temps restant : " + string(minutes) + ":" + string(seconds)

player_info[0] = "Vie(s) : " + string(obj_game.player_life_count)

alarm[0] = game_get_speed(gamespeed_fps)