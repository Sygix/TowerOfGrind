stat[0] = "Temps restant : " + string(floor(obj_game.countdown / 60)) + ":" + string(floor(obj_game.countdown % 60))
stat[1] = "Score : " + string(score)

player_info[0] = "Vie(s) : " + string(obj_game.player_life_count)
player_info[1] = "HP: " + string(health)

alarm[0] = game_get_speed(gamespeed_fps)