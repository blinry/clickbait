extends Node

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        for c in get_children():
            #c.position += delta
            c.position += delta*rand_range(0.5,1.5)
