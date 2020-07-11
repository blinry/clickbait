extends Node2D

signal clicked

func _ready():
    var padding = get_viewport_rect().size.x/8
    position.x = rand_range(padding,get_viewport_rect().size.x-padding)
    position.y = rand_range(padding,get_viewport_rect().size.y-padding)
    $Panel.rect_size.x = rand_range(200,500)
    $Panel.rect_size.y = rand_range(200,500)
    
func area_entered(area):
    emit_signal("clicked")
    queue_free()
 


func _on_advertisement_area_entered(area):
    get_parent().spawnPopups(1,3)


func _on_AdvColorRect_resized():
    $Panel/MarginContainer/VBoxContainer/AdvColorRect/advertisement/CollisionShape2D.position = $Panel/MarginContainer/VBoxContainer/AdvColorRect.rect_size / 2
    $Panel/MarginContainer/VBoxContainer/AdvColorRect/advertisement/CollisionShape2D.shape.extents = $Panel/MarginContainer/VBoxContainer/AdvColorRect.rect_size /2
    
