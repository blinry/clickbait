extends Node2D

func _input(event):
    if event is InputEventMouseButton and get_tree().paused:
        get_tree().paused = false
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
        get_tree().set_input_as_handled()
