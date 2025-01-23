countdown_duration = 60 * 5
countdown = countdown_duration
start_time = current_time
countdown_active = true
doors_close_this_frame = false

for (var i = 0; i < instance_number(obj_doors); ++i;)
{
    doors[i] = instance_find(obj_doors, i);
}
closed_doors = []

doors_closing_interval = countdown_duration / array_length(doors)

player_spawn_point_x = obj_player.x
player_spawn_point_y = obj_player.y
player_life_count = 3
respawn_player = false
score = 0
game_finish = false

ambiant_sound = audio_play_sound(sd_Ambiant_Sound, 2, true)

in_game_ui = instance_create_layer(x, y, "Instances_UI", obj_in_game_menu)