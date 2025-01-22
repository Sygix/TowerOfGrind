if (other.creator != self) {
    health -= other.damage
    
    if (health <= 0) {
        instance_destroy()
    }
    
    instance_destroy(other)
}