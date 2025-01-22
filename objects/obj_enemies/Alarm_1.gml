
if (enemy_state == ENEMY_STATE.FIGHTING) {
    spawn_attack_hitbox();
}
alarm[1] = attack_speed * game_get_speed(gamespeed_fps);