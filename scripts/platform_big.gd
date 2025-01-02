extends AnimatableBody2D

@onready var animation_player = $AnimationPlayer

signal shakeScreenRise
signal shakeScreenSink

var animationSequence = 0

func _ready():
	pass

func _process(delta):
	pass

func _on_button_2_button_pressed():
	animation_player.play("rise")
	shakeScreenRise.emit()

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
			animation_player.play("to_cave_entrance")
		6:
			animation_player.play("to_cave_exit")
		7:
			animation_player.play("to_end_gate")
		8:
			animation_player.play("2_second_wait")
		9:
			animation_player.play("sink")
			shakeScreenSink.emit()
