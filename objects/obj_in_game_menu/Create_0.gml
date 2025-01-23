stats_width = 128
stats_height = 64
player_info_width = 128
player_info_height = 64
font_size = .25

margin = 5
border = 4
space = 6

stat[0] = "Temps restant : " + string(floor(obj_game.countdown / 60)) + ":" + string(floor(obj_game.countdown % 60))
stat[1] = "Score : " + string(score)
stats_length = array_length(stat)

player_info[0] = "Vie(s) : " + string(obj_game.player_life_count)
player_info[1] = "HP: " + string(health)
player_infos_length = array_length(player_info)

alarm[0] = game_get_speed(gamespeed_fps)