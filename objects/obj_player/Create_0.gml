health = 100
damage = 100
is_dead = false

hsp = 0
vsp = 0
movespd = 1
is_attacking = false
tilemap_collision = layer_tilemap_get_id("Collision")

enum Orientation {
    LEFT,
    RIGHT,
    UP,
    DOWN
}

orientation = Orientation.LEFT