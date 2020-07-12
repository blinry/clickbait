extends Node2D

var velocity = Vector2(0,0)
export var friction = 1.0
export var shake = 0
export var user_click = true
export var hasClippy = true
export var notificationText = ""
var clickScn = preload("res://clickSignal.tscn")

var topmost_popup = null

func _process(delta):
    velocity = velocity * friction
    position += velocity
    
    position.x += rand_range(-shake, shake)
    position.y += rand_range(-shake, shake)
    
    var did_bounce_x = false
    var did_bounce_y = false
    
    if position.x < 0:
        position.x = 0
        velocity.x *= -1
        did_bounce_x = true
        
    if position.y < 0:
        position.y = 0
        velocity.y *= -1
        did_bounce_y = true
        
    if position.x > get_viewport_rect().size.x:
        position.x = get_viewport_rect().size.x
        velocity.x *= -1
        did_bounce_x = true
        
    if position.y > get_viewport_rect().size.y:
        position.y = get_viewport_rect().size.y
        velocity.y *= -1
        did_bounce_y = true
    
    if (did_bounce_x and abs(velocity.x) > 2) or (did_bounce_y and abs(velocity.y) > 2):
        print(velocity.length())
        $Bounce.volume_db = range_lerp(velocity.length(), 0, 50, -10, 0)
        $Bounce.play()
  
    if user_click and Input.is_action_just_pressed("click"):
        click()
    
    # Find topmost other area
    var areas = $AlwaysOnArea.get_overlapping_areas()
    if areas.size() > 0:
        var maxIndex = -1
        for a in areas:
            var curIndex = a.get_owner().get_index()
            if curIndex > maxIndex:
                maxIndex = curIndex
                topmost_popup = a.get_owner()
    else:
        topmost_popup = null
        
func click():
    
    
    var clickObj = clickScn.instance()
    clickObj.position = position
    get_tree().get_root().add_child(clickObj)
    
    $Area2D.monitorable = true
    $ClickTimer.start()

func click_timeout():
    $Area2D.monitorable = false
