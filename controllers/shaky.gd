extends Node

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Cursor.position += delta
        $Cursor.position.x += rand_range(-delta.length(), delta.length())
        $Cursor.position.y += rand_range(-delta.length(), delta.length())
