extends Node2D

var currentControllerIndex = 0
var controllers = [
    "res://controllers/normal.tscn",
    "res://controllers/mirrored.tscn",
    "res://controllers/slow.tscn",
    "res://controllers/fast.tscn",
    "res://controllers/slippery.tscn",
    "res://controllers/tiny.tscn",
    "res://controllers/giant.tscn",
    "res://controllers/gravity.tscn",
    "res://controllers/slingshot.tscn",
    "res://controllers/rocket.tscn",
    "res://controllers/shaky.tscn",
    "res://controllers/pet.tscn",
    "res://controllers/invisible.tscn",
]
onready var controller = $Controller

var btnCount = 0

#func _ready():
    #changeController(0)

func _input(event):
    if event.is_action_pressed("click"):
        if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
            Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    
    if event.is_action_pressed("next_controller"):
        changeController(1)
        
    if event.is_action_pressed("prev_controller"):
        changeController(-1)
       
func changeController(diff):
    #for btn in get_tree().get_nodes_in_group("popups"):
    #    btn.queue_free()
    
    var currentPosition = controller.get_child(0).position
    #var currentVelocity = controller.get_child(0).velocity
    
    controller.queue_free()
    
    currentControllerIndex = (currentControllerIndex + diff + controllers.size()) % controllers.size()
    var controllerScene = load(controllers[currentControllerIndex])
    controller = controllerScene.instance()
    add_child(controller)

    $ControllerLabel.text = controller.name
    controller.get_child(0).position = currentPosition
    #controller.get_child(0).velocity = currentVelocity
    spawnPopups(3, 8)

func button_clicked():
    btnCount -= 1
    print(btnCount)
    if btnCount == 0:
        changeController(1) 
    
func spawnPopups(wmin, wmax):
    btnCount = randi() % (wmax-wmin) + wmin
    for i in range(btnCount):
        var btnScn = load("res://window.tscn")
        var btn = btnScn.instance()
        add_child(btn)
        btn.connect("clicked", self, "button_clicked")


func _on_Area2D_area_entered(area):
    changeController(0)
    spawnPopups(2, 4)
    $Icon.hide()
