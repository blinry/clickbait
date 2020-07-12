extends Node

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Cursor.velocity += delta/30

func _process(delta):
        $Cursor.velocity += Vector2(0,30*delta)
