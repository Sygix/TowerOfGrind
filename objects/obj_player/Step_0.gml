key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)


moveH = key_right - key_left
hsp = moveH * movespd
moveV = key_down - key_up
vsp = moveV * movespd

if (key_right || key_left) {
    x += hsp
} 
if (key_down || key_up) {
    y += vsp
}


if (hsp == 0 && vsp == 0) {
    sprite_index = spr_D_Idle
}

if (key_left || key_right) {
    sprite_index = spr_S_Walk
} else if (key_up) {
    sprite_index = spr_U_Walk
} else if (key_down) {
    sprite_index = spr_D_Walk
}