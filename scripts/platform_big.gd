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
			animation_player.play("2_second_wait")
		2:
			animation_player.play("move_right")
		3:
			animation_player.play("7_second_wait")
		4:
			animation_player.play("move_up")
		5:
			animation_player.play("move_through_clouds")
		6:
			animation_player.play("5_second_wait")
		7:
			animation_player.play("sink")
