var new_stat_width = 0 
for (var i = 0; i < stats_length; i++) {
    var stat_width = string_width(stat[i])
    new_stat_width = max(new_stat_width, stat_width)
}
player_info_width = (new_stat_width * font_size) + border * 2
player_info_height = border * 2 + string_height(stat[0]) * font_size + (stats_length - 1) * space

var stats_x = camera_get_view_x(view_camera[0]) + margin
var stats_y = camera_get_view_y(view_camera[0]) + margin

draw_sprite_ext(sprite_index, image_index, stats_x, stats_y, player_info_width / sprite_width, player_info_height / sprite_height, 0, c_white, 1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

for (var i = 0; i < stats_length; i++) {
    draw_text_transformed(stats_x + border, stats_y + border + space * i, stat[i], font_size, font_size, 0)
}


var new_player_info_width = 0 
for (var i = 0; i < player_infos_length; i++) {
    var player_info_width = string_width(player_info[i])
    new_player_info_width = max(new_player_info_width, player_info_width)
}
stats_width = (new_player_info_width * font_size) + border * 2
stats_height = border * 2 + string_height(player_info[0]) * font_size + (player_infos_length - 1) * space

var player_infos_x = camera_get_view_x(view_camera[0]) + margin
var player_infos_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - stats_height - margin

draw_sprite_ext(sprite_index, image_index, player_infos_x, player_infos_y, stats_width / sprite_width, stats_height / sprite_height, 0, c_white, 1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

for (var i = 0; i < player_infos_length; i++) {
    draw_text_transformed(player_infos_x + border, player_infos_y + border + space * i, player_info[i], font_size, font_size, 0)
}