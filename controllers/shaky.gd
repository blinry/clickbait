extends Node

signal click(pos)

var shake = 25

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("click", event.position)
	if event is InputEventMouseMotion:
		var delta = event.get_relative()
		$Cursor.position += delta
		$Cursor.position.x += rand_range(-delta.length(), delta.length())
		$Cursor.position.y += rand_range(-delta.length(), delta.length())
		
func _process(delta):
	$Cursor.position.x += rand_range(-shake, shake)
	$Cursor.position.y += rand_range(-shake, shake)
