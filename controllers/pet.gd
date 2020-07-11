extends Node

signal click

func _input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        emit_signal("click")
        var direction = $Crosshair.position - $Cursor.position
        direction = direction.normalized() * 30
        $Cursor.velocity = direction
        
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Crosshair.position += delta
