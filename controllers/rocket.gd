extends Node

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Cursor.rotation_degrees += delta.x/10

func _process(delta):
    if Input.is_action_pressed("rightclick"):
        var direction = Vector2(0,-1).rotated(-PI/6 + $Cursor.rotation)
        $Cursor.velocity += direction/2
        $Cursor/Particles.emitting = true
    else:
        $Cursor/Particles.emitting = false
