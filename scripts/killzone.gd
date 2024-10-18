extends Area2D
@onready var timer = $Timer
@onready var hurt = $Hurt

func _on_body_entered(body):
	print("You Died")
	hurt.play()
	body.hasDied()
	Engine.time_scale = 0.5
	#When a body enters the killzone time will be set to half speed
#Because the player is the only thing that the collision can detect due to the mask property, 
#here we go and remove its collision temporarily for effect
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
