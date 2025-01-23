options_width = 64
options_height = 128
game_stats_width = 64
game_stats_height = 128
font_size = .5

border = 8
space = 16
space_between_menu = space * 5 / 2

pos = 0

game_stat[0] = "Score"
game_stat[1] = score
game_stat[2] = "Temps restant"
minutes = floor(obj_game.countdown / 60)
seconds = floor(obj_game.countdown % 60)
if (seconds < 10) {
    seconds = "0" + string(seconds)
}
game_stat[3] = string(minutes) + ":" + string(seconds)
game_stats_length = array_length(game_stat)

option[0] = "Reessayer"
option[1] = "Menu principal"
option[2] = "Quitter"
options_length = array_length(option)