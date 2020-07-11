extends Node2D

var currentControllerIndex = 0
var controllers = [
    "res://controllers/normal.tscn",
    "res://controllers/mirrored.tscn",
    "res://controllers/shaky.tscn",
    "res://controllers/slippery.tscn",
    "res://controllers/pet.tscn",
    ]
onready var controller = $Controller

func _ready():
    changeController(0)

func _input(event):
    if event.is_action_pressed("next_controller"):
        changeController(1)
        
    if event.is_action_pressed("prev_controller"):
        changeController(-1)
       
func changeController(diff):
    var currentPosition = controller.get_child(0).position
    #var currentVelocity = controller.get_child(0).velocity
    
    controller.queue_free()
    
    currentControllerIndex = (currentControllerIndex + diff + controllers.size()) % controllers.size()
    var controllerScene = load(controllers[currentControllerIndex])
    controller = controllerScene.instance()
    add_child(controller)
    controller.connect("click", $Button, "click")
    controller.connect("click", $ClickSignal, "ping")
    $Button.connect("clicked", self, "button_clicked")
    
    $ControllerLabel.text = controller.name
    controller.get_child(0).position = currentPosition
    #controller.get_child(0).velocity = currentVelocity

func button_clicked():
    changeController(1)
