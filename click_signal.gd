extends Node2D

func _ready():
    $AnimationPlayer.play("ping")
    $Click.pitch_scale = rand_range(0.9,1.1)
    $Click.play()

func _on_AnimationPlayer_animation_finished(anim_name):
    queue_free()
