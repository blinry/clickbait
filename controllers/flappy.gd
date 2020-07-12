extends Node

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Cursor.position.x += delta.x
    if event is InputEventMouseButton:
        $Cursor.velocity.y = -15

func _process(delta):
        $Cursor.velocity += Vector2(0,30*delta)
