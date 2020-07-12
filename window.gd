extends Node2D

signal clicked

onready var adColorRect = $Panel/MarginContainer/VBoxContainer/AdvColorRect
onready var adCollisionShape = $Panel/MarginContainer/VBoxContainer/AdvColorRect/advertisement/CollisionShape2D

func _ready():
    var padding = get_viewport_rect().size.x/128
    
    $Panel.rect_size.x = rand_range(200,500)
    $Panel.rect_size.y = rand_range(200,500)
    
    var w = $Panel.rect_size.x
    var h = $Panel.rect_size.y
    
    position.x = rand_range(padding,get_viewport_rect().size.x-padding-w)
    position.y = rand_range(padding,get_viewport_rect().size.y-padding-h)
    
func area_entered(area):
    emit_signal("clicked")
    queue_free()
 
func _on_advertisement_area_entered(area):
    get_parent().spawnPopups(1,3)


func _on_AdvColorRect_resized():
    adCollisionShape.position = adColorRect.rect_size / 2
    adCollisionShape.shape.extents = adColorRect.rect_size /2
