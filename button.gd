extends Node2D

signal clicked

var hovered = false

func area_entered(area):
    hovered = true

func area_exited(area):
    hovered = false

func click():
    if hovered:
        emit_signal("clicked")
