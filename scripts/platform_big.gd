extends AnimatableBody2D

@onready var animation_player = $AnimationPlayer

var animationSequence = 0

func _ready():
	pass

func _process(delta):
	pass

func _on_button_2_button_pressed():
	animation_player.play("rise")

func _on_animation_player_animation_finished(anim_name):
	animationSequence+=1
	match animationSequence:
		1:
			animation_player.play("move_right")
		2:
			animation_player.play("move_up")
