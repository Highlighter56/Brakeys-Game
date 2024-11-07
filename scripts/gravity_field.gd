extends Area2D

@onready var player = %Player

@onready var PLAYER_MAX_FALL_SPEED = player.maxFallSpeed
@export var FIELD_MAX_FALL_SPEED = 100
#var PROJECT_GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

func _on_body_entered(body):
	#print("Body Entered")
	#ProjectSettings.set_setting("physics/2d/default_gravity", field_gravity)
	player.maxFallSpeed = FIELD_MAX_FALL_SPEED


func _on_body_exited(body):
	#print("Body Exited")
	#ProjectSettings.set_setting("physics/2d/default_gravity", PROJECT_GRAVITY)
	player.maxFallSpeed = PLAYER_MAX_FALL_SPEED
