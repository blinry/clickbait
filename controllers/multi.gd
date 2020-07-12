extends Node

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        for c in get_children():
            #c.position += delta
            c.velocity = lerp(c.velocity, delta, 0.5)*rand_range(0.5,1.5)
