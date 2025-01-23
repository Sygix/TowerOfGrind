var keys = {
    up: keyboard_check_pressed(vk_up),
    down: keyboard_check_pressed(vk_down),
    accept: keyboard_check_pressed(vk_space)
}

if (keys.up || keys.down) {
    audio_play_sound(sd_Menu_Sound_Hover, 1, false)
}

pos += keys.down - keys.up
if (pos >= options_length) {
    pos = 0
}
if (pos < 0) {
    pos = options_length - 1
}

if (keys.accept) {
    audio_play_sound(sd_Menu_Sound_Forward, 1, false)
    switch (pos) {
        case 0: room_goto(Room1) break
        case 1: room_goto(Room_MainMenu) break
        case 2: game_end() break
    }
}