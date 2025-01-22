if (other.creator != self && object_is_ancestor(self.object_index, other.creator.object_index)) {
    health -= other.damage;
    if(health <= 100) instance_destroy();
    instance_destroy(other);
}