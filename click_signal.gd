extends Node2D

func ping():
    $AnimationPlayer.stop()
    $AnimationPlayer.play("ping")
