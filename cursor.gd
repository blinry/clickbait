extends Node2D

var velocity = Vector2(0,0)
export var friction = 1.0
export var shake = 0
export var user_click = true
var clickScn = preload("res://clickSignal.tscn")

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
        
    if position.x > get_viewport_rect().size.x:
        position.x = get_viewport_rect().size.x
        velocity.x *= -1
        
    if position.y > get_viewport_rect().size.y:
        position.y = get_viewport_rect().size.y
        velocity.y *= -1
  
    if user_click and Input.is_action_just_pressed("click"):
        click()
        
func click():
    
    
    var clickObj = clickScn.instance()
    clickObj.position = position
    get_tree().get_current_scene().add_child(clickObj)
    
    $Area2D.monitorable = true
    print("monitor!")
    $ClickTimer.start()

func click_timeout():
    $Area2D.monitorable = false
    print("unmonitor!")
