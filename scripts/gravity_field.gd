extends Area2D

@export var field_gravity = 200
var PROJECT_GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

func _on_body_entered(body):
	ProjectSettings.set_setting("physics/2d/default_gravity", field_gravity)
	print("Body Entered")


func _on_body_exited(body):
	ProjectSettings.set_setting("physics/2d/default_gravity", PROJECT_GRAVITY)
	print("Body Exited")
