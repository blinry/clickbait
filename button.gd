extends Node2D

signal clicked

func _ready():
    var padding = get_viewport_rect().size.x/8
    position.x = rand_range(padding,get_viewport_rect().size.x-padding)
    position.y = rand_range(padding,get_viewport_rect().size.y-padding)

func area_entered(area):
    emit_signal("clicked")
    queue_free()
