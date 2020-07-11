extends Node

signal click(pos)

func _process(delta):
    pass
    var m = get_viewport().get_mouse_position()
    $Cursor.position = m

func _input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        emit_signal("click", event.position)
