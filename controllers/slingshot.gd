extends Node

var direction = Vector2(0,0)
var pulling = false
var flying = false

func _input(event):
    if event is InputEventMouseMotion:
        var delta = event.get_relative()
        #$Cursor.rotation_degrees += delta.x/10
        if pulling:
            direction += delta
            $Cursor/Line.points[1] = $Cursor/Line.points[0] + direction
    
    if not flying:
        if event.is_action_pressed("click"):
            pulling = true
            direction = Vector2(0,0)
            $Cursor/Line.points[1] = $Cursor/Line.points[0]
            $Cursor/Line.show()
        if event.is_action_released("click"):
            $Cursor.velocity = direction/10
            flying = true
            $Cursor/Line.points[1] = $Cursor/Line.points[0]
            $Cursor/Line.hide()

func _process(delta):
    if flying and $Cursor.velocity.length() < 0.1:
        $Cursor.click()
        flying = false
