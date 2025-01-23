show_debug_message("attack_hitbox");
if (other.creator != object_index) {
    show_debug_message(other.damage);
    health -= other.damage;
    if(health <= 100) {
        audio_play_sound(sd_goblin_death, 1, false);
        instance_destroy();
        score += kill_score;
    }
    instance_destroy(other);
}