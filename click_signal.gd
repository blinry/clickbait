extends Node2D

func _ready():
    $AnimationPlayer.play("ping")

func _on_AnimationPlayer_animation_finished(anim_name):
    queue_free()
