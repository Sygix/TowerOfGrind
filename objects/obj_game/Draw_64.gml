if (game_finish) {
    instance_destroy(in_game_ui)
    instance_create_layer(x, y, "Instances_UI", obj_end_game_menu)
}