extends Node

func _ready():
    $Cursor/cursor.visible = false

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Cursor.position += delta
        
