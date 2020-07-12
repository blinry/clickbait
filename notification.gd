extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.
    
func notify(text):
    $Panel/MarginContainer/RichTextLabel.text = text
    print(get_viewport_rect().size)
    $AnimationPlayer.play("open")
    $Timer.wait_time = text.length()/7
    $Timer.start()
    yield($Timer, "timeout")
    close()
    
func close():
    $AnimationPlayer.play_backwards("open")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
