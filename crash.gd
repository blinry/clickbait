extends Node2D

func _ready():
    $Label.text += "\n\nYou closed "+str(game.closed_windows)+" windows."
    $Label.text += "\nYou clicked on "+str(game.ad_clicks)+" popups."
    $Label.text += "\n\nThanks for playing! <3"
    $Label.text += "\n\nPress escape to restart. You can press 9 and 0 to change modes."
    

func _input(event):
    if event.is_action_pressed("quit"):
        game.closed_windows = 0
        game.ad_clicks = 0
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
        get_tree().change_scene("res://main.tscn")
