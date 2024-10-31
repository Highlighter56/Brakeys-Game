extends Camera2D

@onready var player = %Player

var shouldOffset = false
var maxVerticleOffset = 0
var rateOfChange = 2

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	print("Max: "+str(maxVerticleOffset)+" Current: "+str(offset.y))
	# Prepare to Offset
	if(player.currentState==player.state.FALLING):
		maxVerticleOffset=90
		rateOfChange=2
	elif(player.currentState==player.state.SLIDING):
		maxVerticleOffset=70
		rateOfChange=.5
	else:
		maxVerticleOffset=0
	# Offset
	if(shouldOffset):
		offset.y = move_toward(offset.y, maxVerticleOffset, rateOfChange)
	


func _on_gravity_field_body_entered(body):
	shouldOffset=true


func _on_gravity_field_body_exited(body):
	shouldOffset=false
