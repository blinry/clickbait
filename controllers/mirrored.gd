extends Node

signal click(pos)

func _input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        emit_signal("click", $Cursor.position)
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Cursor.position -= delta
