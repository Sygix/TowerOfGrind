show_debug_message("attack_hitbox");
if (other.creator != object_index) {
    show_debug_message(other.damage);
    enemy_health -= other.damage;
    if(enemy_health <= 100) {
        audio_play_sound(sd_goblin_death, 1, false);
        instance_destroy();
        score += kill_score;
    }
    instance_destroy(other);
}