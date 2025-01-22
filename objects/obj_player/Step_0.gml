var keys = {
    left: keyboard_check(vk_left),
    right: keyboard_check(vk_right),
    up: keyboard_check(vk_up),
    down: keyboard_check(vk_down),
    space: keyboard_check_pressed(vk_space)
}

hsp = (keys.right - keys.left) * movespd
vsp = (keys.down - keys.up) * movespd

if (is_attacking) {
    switch (image_index) {
        case 2: SpawnHitbox() break
        case 4: 
            instance_destroy(obj)
            is_attacking = false
            mask_index = spr_Player_Front_Walk
            ds_list_clear(hitByAttack)
        break
    }
}

function SpawnHitbox() {
    switch (orientation) {
        case Orientation.LEFT: 
            obj = instance_create_depth(x - sprite_width / 2, y - sprite_height / 4, depth, obj_attack_hitbox)
        break
        case Orientation.RIGHT : 
            obj = instance_create_depth(x, y - sprite_height / 4, depth, obj_attack_hitbox)
        break
        case Orientation.UP: 
            obj = instance_create_depth(x - sprite_width / 4, y - sprite_height / 2, depth, obj_attack_hitbox)
        break
        case Orientation.DOWN : 
            obj = instance_create_depth(x - sprite_width / 4, y, depth, obj_attack_hitbox)
        break
    }
    obj.creator = object_index
    obj.damage = damage
    show_debug_message("HELLo")
}


if (!is_attacking) {
    if (hsp == 0 && vsp == 0) {
        switch (orientation) {
            case Orientation.LEFT: sprite_index = spr_Player_Side_Idle image_xscale = 1 break
            case Orientation.RIGHT: sprite_index = spr_Player_Side_Idle image_xscale = -1 break
            case Orientation.UP: sprite_index = spr_Player_Back_Idle image_xscale = 1 break
            case Orientation.DOWN: sprite_index = spr_Player_Front_Idle image_xscale = 1 break
        }
    }
    
    if (keys.left) {
        orientation = Orientation.LEFT
        image_xscale = 1
        sprite_index = spr_Player_Side_Walk
        if (!place_meeting(x - movespd, y, tilemap_collision)) {
            x += hsp
        }
    } else if (keys.right) {
        orientation = Orientation.RIGHT
        image_xscale = -1
        sprite_index = spr_Player_Side_Walk
        if (!place_meeting(x + movespd, y, tilemap_collision)) {
            x += hsp
        }
    } else if (keys.up) {
        orientation = Orientation.UP
        image_xscale = 1
        sprite_index = spr_Player_Back_Walk
        if (!place_meeting(x, y - movespd, tilemap_collision)) {
            y += vsp
        }
    } else if (keys.down) {
        orientation = Orientation.DOWN
        image_xscale = 1
        sprite_index = spr_Player_Front_Walk
        if (!place_meeting(x, y + movespd, tilemap_collision)) {
            y += vsp
        }
    }
    
    if (keys.space) {
        is_attacking = true
        switch (orientation) {
            case Orientation.LEFT: 
                sprite_index = spr_Player_Side_Attack 
                image_xscale = 1 
                mask_index = spr_Player_Side_Attack_Hitbox
            break
            case Orientation.RIGHT: 
                sprite_index = spr_Player_Side_Attack 
                image_xscale = -1
                mask_index = spr_Player_Side_Attack_Hitbox
            break
            case Orientation.UP: 
                sprite_index = spr_Player_Back_Attack 
                image_xscale = 1
                mask_index = spr_Player_Back_Attack_Hitbox
            break
            case Orientation.DOWN: 
                sprite_index = spr_Player_Front_Attack 
                image_xscale = 1 
                mask_index = spr_Player_Front_Attack_Hitbox
            break
        }
        image_index = 0
    }
}