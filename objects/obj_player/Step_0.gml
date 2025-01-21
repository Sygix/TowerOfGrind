
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)
key_space = keyboard_check(vk_space)

hsp = (key_right - key_left) * movespd
vsp = (key_down - key_up) * movespd

if (is_attacking && image_index > 3) {
    is_attacking = false
}

if (!is_attacking) {
    if ((key_right && !place_meeting(x + movespd, y, tilemap_collision)) || (key_left && !place_meeting(x - movespd, y, tilemap_collision))) {
        x += hsp
    }
    if ((key_down && !place_meeting(x, y + movespd, tilemap_collision)) || (key_up && !place_meeting(x, y - movespd, tilemap_collision))) {
        y += vsp
    }
    
    if (hsp == 0 && vsp == 0) {
        image_xscale = 1
        sprite_index = spr_Player_Front_Idle
    }
    
    if (key_left) {
        image_xscale = 1
        sprite_index = spr_Player_Side_Walk
    } else if (key_right) {
        image_xscale = -1
        sprite_index = spr_Player_Side_Walk
    } else if (key_up) {
        image_xscale = 1
        sprite_index = spr_Player_Back_Walk
    } else if (key_down) {
        image_xscale = 1
        sprite_index = spr_Player_Front_Walk
    }
    
    if (key_space) {
        is_attacking = true
        sprite_index = spr_Player_Side_Attack
        image_index = 0
    }
}