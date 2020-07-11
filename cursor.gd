extends Node2D

var velocity = Vector2(0,0)
export var friction = 1.0
export var shake = 0

func _process(delta):
    velocity = velocity * friction
    position += velocity
    
    position.x += rand_range(-shake, shake)
    position.y += rand_range(-shake, shake)
    
    if position.x < 0:
        position.x = 0
        velocity.x *= -1
        
    if position.y < 0:
        position.y = 0
        velocity.y *= -1
        
    if position.x > get_viewport().size.x:
        position.x = get_viewport().size.x
        velocity.x *= -1
        
    if position.y > get_viewport().size.y:
        position.y = get_viewport().size.y
        velocity.y *= -1
