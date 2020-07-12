extends Node2D

var running = false
var won = false
var intro_phase = 0

var maxPopups = 20

var currentControllerIndex = 0
var controllers = [
    "res://controllers/normal.tscn",
    "res://controllers/rotated.tscn",
    "res://controllers/flappy.tscn",
    "res://controllers/multi.tscn",
    "res://controllers/dark.tscn",
    "res://controllers/mirrored.tscn",
    "res://controllers/slow.tscn",
    "res://controllers/fast.tscn",    
    "res://controllers/shaky.tscn",
    "res://controllers/rocket.tscn",
    "res://controllers/slippery.tscn",
    "res://controllers/tiny.tscn",
    "res://controllers/giant.tscn",
    "res://controllers/gravity.tscn",
    "res://controllers/slingshot.tscn",
    "res://controllers/pet.tscn",
    "res://controllers/invisible.tscn",
]
onready var controller = null

var btnCount = 0

func _input(event): 
    if event.is_action_pressed("next_controller"):
        changeController(1)
        
    if event.is_action_pressed("prev_controller"):
        changeController(-1)
    
    if event.is_action_pressed("down"):
        win()
    
    if event.is_action_pressed("quit"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
        get_tree().paused = true
    
    #if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
    #    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
  
func _process(delta):
    if running:
        var numPopups = get_tree().get_nodes_in_group("popups").size()
        
        if intro_phase >= 6:
            if numPopups == 0 and not won:
                changeController(1)
                if currentControllerIndex == 0:
                    win()
                else:
                    spawnPopups(5, 8)
            if won:
                if randi() % (2) == 0:
                    spawnPopups(1,1)
            else:
                if randi() % (60*5) == 0:
                    spawnPopups(1,1)
                       
        if numPopups == 0:
            if intro_phase == 5:
                spawnPopups(5, 8)
                intro_phase = 6
            if intro_phase == 4:
                spawnPopup("Close all popups to win!")
                intro_phase = 5
            if intro_phase == 3:
                spawnPopup("By blinry and bleeptrack")
                intro_phase = 4
            if intro_phase == 2:
                spawnPopup("For GMTK game jam 2020")
                intro_phase = 3
            if intro_phase == 1:
                spawnPopup("A game made in 48 hours")
                intro_phase = 2
            if intro_phase == 0:
                spawnPopup("CLICKBAIT")
                intro_phase = 1
      
func win():
    print("you win")
    won = true
    maxPopups = 100
    
func crash():
    get_tree().change_scene("res://crash.tscn")
    
func changeController(diff):
    $Notification.notify("Achtung! Dies ist ein Test!")
    
    var currentPosition = Vector2(0,0)
    if controller:
        currentPosition = controller.get_child(0).position
    
        controller.queue_free()
    
    currentControllerIndex = (currentControllerIndex + diff + controllers.size()) % controllers.size()
    var controllerScene = load(controllers[currentControllerIndex])
    controller = controllerScene.instance()
    add_child(controller)

    $ControllerLabel.text = controller.name
    controller.get_child(0).position = currentPosition
    
func spawnPopups(wmin, wmax):
    var numPopups = get_tree().get_nodes_in_group("popups").size()
    
    if numPopups >= 100:
        crash()
    
    if wmax > wmin:
        btnCount = (randi() % (wmax-wmin)) + wmin
    else:
        btnCount = wmin
        
    # Limit total number of popups.
    print(maxPopups)
    btnCount = min(btnCount, maxPopups-numPopups)
    print(btnCount)
    
    for i in range(btnCount):
        spawnPopup()

func spawnPopup(text=""):
    var btnScn = load("res://window.tscn")
    var btn = btnScn.instance()
    btn.set_text(text)
    add_child(btn)

func icon_clicked(viewport, event, shape_idx):
    if event is InputEventMouseButton:
        changeController(0)
        controller.get_child(0).position = event.position
        #spawnPopups(5, 8)
        running = true
        $Icon.hide()
        if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
            Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
