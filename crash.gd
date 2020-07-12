extends Node2D

func _ready():
    $Label.text += "\n\nYou closed "+str(game.closed_windows)+" windows."
    $Label.text += "\nYou clicked on ads "+str(game.ad_clicks)+" times."
