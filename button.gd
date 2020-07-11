extends Node2D

signal clicked

var hovered = false

func _ready():
    position.x = rand_range(150,get_viewport().size.x-150)
    position.y = rand_range(150,get_viewport().size.y-150)

func area_entered(area):
    hovered = true

func area_exited(area):
    hovered = false

func click(pos):
    if hovered:
        emit_signal("clicked")
        queue_free()
        
