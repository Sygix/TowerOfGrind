if (other.creator != object_index) {
    health -= other.damage
    show_debug_message("HIT")
    audio_play_sound(sd_hurt, 1, false)
    
    if (health <= 0) {
        is_dead = true
        audio_stop_sound(player_walk_sound)
        
        switch (orientation) {
            case Orientation.LEFT: 
                sprite_index = spr_Player_Side_Death
                image_xscale = 1
                image_index = 0
            break
            case Orientation.RIGHT: 
                sprite_index = spr_Player_Side_Death
                image_xscale = -1
                image_index = 0
            break
            case Orientation.UP: 
                sprite_index = spr_Player_Back_Death
                image_xscale = 1
                image_index = 0
            break
            case Orientation.DOWN: 
                sprite_index = spr_Player_Front_Death
                image_xscale = 1
                image_index = 0
            break
        }
    }
    
    instance_destroy(other)
}