if(array_find_index(obj_game.closed_doors, function (door) {
    return door.id == other.id;
})) {
    movement_state = MOVEMENT_STATE.BLOCKED;
}