extends Node2D

onready var adColorRect = $Panel/MarginContainer/VBoxContainer/AdvColorRect

onready var adCollisionShape = $Panel/MarginContainer/VBoxContainer/AdvColorRect/advertisement/CollisionShape2D
onready var bodyCollisionShape = $Panel/body/CollisionShape2D

func _ready():
    var padding = get_viewport_rect().size.x/128
    
    $Panel.rect_size.x = rand_range(200,500)
    $Panel.rect_size.y = rand_range(200,500)
    
    var w = $Panel.rect_size.x
    var h = $Panel.rect_size.y
    
    position.x = rand_range(padding,get_viewport_rect().size.x-padding-w)
    position.y = rand_range(padding,get_viewport_rect().size.y-padding-h)
    
    scale = Vector2(0,0)
    $ShowTimer.wait_time = rand_range(0.0, 0.3)
    $ShowTimer.start()
    yield($ShowTimer, "timeout")
    $AnimationPlayer.play("spawn")
    $Pop.pitch_scale = rand_range(0.9,1.1)
    $Pop.play()
    
func area_entered(area):
    if self == area.get_owner().topmost_popup:
        #$Close.pitch_scale = rand_range(0.9,1.1)
        #$Close.play()
        game.closed_windows += 1
        $AnimationPlayer.play_backwards("spawn")
        yield($AnimationPlayer, "animation_finished")
        queue_free()
 
func _on_advertisement_area_entered(area):
    if self == area.get_owner().topmost_popup:
        #$Error.pitch_scale = rand_range(0.8,1.2)
        #$Error.play()
        game.ad_clicks += 1
        get_parent().spawnPopups(1,3)
    
func _on_AdvColorRect_resized():
    adCollisionShape.position = adColorRect.rect_size / 2
    adCollisionShape.shape.extents = adColorRect.rect_size /2

    bodyCollisionShape.position = $Panel.rect_size / 2
    bodyCollisionShape.shape.extents = $Panel.rect_size /2
