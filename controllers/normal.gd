extends Node

signal click(pos)

func _input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        emit_signal("click", event.position)
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Cursor.position += delta


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	var m = get_viewport().get_mouse_position()
	$Cursor.position = m
