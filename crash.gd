extends Node2D

func _ready():
    $Label.text += "\n\nYou closed "+str(game.closed_windows)+" windows."
    $Label.text += "\nYou clicked on "+str(game.ad_clicks)+" popups."

func _input(event):
    if event.is_action_pressed("quit"):
        get_tree().quit()
