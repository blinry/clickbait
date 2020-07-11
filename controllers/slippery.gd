extends Node

signal click(pos)

var velocity = Vector2(0,0)

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("click", event.position)
	if event is InputEventMouseMotion:
		var delta = event.get_relative()
		velocity = lerp(velocity, delta, 0.05)
			
func _process(delta):
	velocity = velocity * 0.95
	print(velocity)
	$Cursor.position += velocity
	
	if $Cursor.position.x < 0:
		$Cursor.position.x = 0
		velocity.x *= -1
		
	if $Cursor.position.y < 0:
		$Cursor.position.y = 0
		velocity.y *= -1
		
	if $Cursor.position.x > get_viewport().size.x:
		$Cursor.position.x = get_viewport().size.x
		velocity.x *= -1
		
	if $Cursor.position.y > get_viewport().size.y:
		$Cursor.position.y = get_viewport().size.y
		velocity.y *= -1
