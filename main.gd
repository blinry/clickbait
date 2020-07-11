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

var btnCount = 0

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
    controller.connect("click", $ClickSignal, "ping")

    $ControllerLabel.text = controller.name
    controller.get_child(0).position = currentPosition
    #controller.get_child(0).velocity = currentVelocity
    spawnPopups()

func button_clicked():
    btnCount -= 1
    print(btnCount)
    if btnCount == 0:
        changeController(1)
    
        
    
func spawnPopups():
    btnCount = randi() % 5 + 3
    for i in range(btnCount):
        var btnScn = load("res://button.tscn")
        var btn = btnScn.instance()
        add_child(btn)
        controller.connect("click", btn, "click")
        btn.connect("clicked", self, "button_clicked")
