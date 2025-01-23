show_debug_message("attack_hitbox");
if (other.creator != object_index) {
    show_debug_message(other.damage);
    health -= other.damage;
    if(health <= 100) {
        instance_destroy();
        score += kill_score;
    }
    instance_destroy(other);
}