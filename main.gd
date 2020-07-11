extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentController = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _input(event):
    
    
    if event.is_action_pressed("next_controller"):
        $Controllers.get_child(currentController).hide()
        currentController = (currentController + 1) % $Controllers.get_child_count()
        $Controllers.get_child(currentController).show()
        
    if event.is_action_pressed("prev_controller"):
        $Controllers.get_child(currentController).hide()
        currentController = (currentController - 1) % $Controllers.get_child_count()
        $Controllers.get_child(currentController).show()
        
        
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
