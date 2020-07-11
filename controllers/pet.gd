extends Node


func _input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        var direction = $Crosshair.position - $Cursor.position
        direction = direction.normalized() * 30
        $Cursor.velocity = direction
        
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        $Crosshair.position += delta

func _process(delta):
    if randi() % 60 == 0:
        $Cursor.click()
