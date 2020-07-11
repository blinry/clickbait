extends Node2D

func ping(pos):
    position = pos
    $AnimationPlayer.stop()
    $AnimationPlayer.play("ping")
