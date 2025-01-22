var keys = {
    up: keyboard_check_pressed(vk_up),
    down: keyboard_check_pressed(vk_down),
    accept: keyboard_check_pressed(vk_space)
}

pos += keys.down - keys.up
if (pos >= options_length) {
    pos = 0
}
if (pos < 0) {
    pos = options_length - 1
}

if (keys.accept) {
    switch (pos) {
        case 0: room_goto(Room1) break
        case 1: game_end() break
    }
}