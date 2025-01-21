key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)


moveH = key_right - key_left
hsp = moveH * movespd
moveV = key_down - key_up
vsp = moveV * movespd

if ((key_right && !place_meeting(x + movespd, y, tilemap_collision)) || (key_left && !place_meeting(x - movespd, y, tilemap_collision))) {
    x += hsp
}
if ((key_down && !place_meeting(x, y + movespd, tilemap_collision)) || (key_up && !place_meeting(x, y - movespd, tilemap_collision))) {
    y += vsp
}


if (hsp == 0 && vsp == 0) {
    image_xscale = 1
    sprite_index = spr_D_Idle
}

if (key_left) {
    image_xscale = 1
    sprite_index = spr_S_Walk
} else if (key_right) {
    image_xscale = -1
    sprite_index = spr_S_Walk
} else if (key_up) {
    image_xscale = 1
    sprite_index = spr_U_Walk
} else if (key_down) {
    image_xscale = 1
    sprite_index = spr_D_Walk
}