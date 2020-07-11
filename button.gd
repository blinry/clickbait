extends Node2D

var hovered = false

func area_entered(area):
    print("bounce!")
    hovered = true

func area_exited(area):
    print("debounce!")
    hovered = false

func click(pos):
    if hovered:
        print("clicked!!!!")
