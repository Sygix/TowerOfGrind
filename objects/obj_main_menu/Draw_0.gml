var new_option_width = 0 
for (var i = 0; i < options_length; i++) {
    var option_width = string_width(option[i])
    new_option_width = max(new_option_width, option_width)
}
options_width = (new_option_width * font_size) + border * 2
options_height = border * 2 + string_height(option[0]) * font_size + (options_length - 1) * space

var options_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - options_width / 2
var options_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - options_height / 2

draw_sprite_ext(sprite_index, image_index, options_x, options_y, options_width / sprite_width, options_height / sprite_height, 0, c_white, 1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

for (var i = 0; i < options_length; i++) {
    var text_color = c_white
    if (pos == i) {
        text_color = c_yellow
    }
    var option_text_x = options_x + (options_width - string_width(option[i]) * font_size) / 2
    draw_text_transformed_colour(option_text_x, options_y + border + space * i, option[i], font_size, font_size, 0, text_color, text_color, text_color, text_color, 1)
}