extends Area2D

@onready var animation_player = $AnimationPlayer

var jump_boost = -400

func _ready():
	pass

func _process(delta):
	pass


func _on_body_entered(body):
	animation_player.play("collect")
	body.velocity.y = jump_boost
