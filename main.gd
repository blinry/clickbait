extends Node2D

var currentController = 0

func _ready():
    changeController(0)

func _input(event):
    if event.is_action_pressed("next_controller"):
        changeController(1)
        
    if event.is_action_pressed("prev_controller"):
        changeController(-1)
       
func changeController(diff):
    var currentPosition = $Controllers.get_child(currentController).get_child(0).position
    var currentVelocity = $Controllers.get_child(currentController).get_child(0).velocity
    
    $Controllers.get_child(currentController).hide()
    currentController = (currentController + diff + $Controllers.get_child_count()) % $Controllers.get_child_count()
    $Controllers.get_child(currentController).show()
    $ControllerLabel.text = $Controllers.get_child(currentController).name
    $Controllers.get_child(currentController).get_child(0).position = currentPosition
    $Controllers.get_child(currentController).get_child(0).velocity = currentVelocity

func button_clicked():
    changeController(1)
