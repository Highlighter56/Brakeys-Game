extends Node2D

var range = 10
var height : int
var speed : float
var baseHeight = 392

func _ready():
	height = randi_range(baseHeight-range, baseHeight+range)
	speed = randf_range(1,5)
	#speed = 15

func _process(delta):
	pass

func _physics_process(delta):
	if(position.y != height):
		position.y = move_toward(position.y, height, speed*delta)
	else:
		height = randi_range(baseHeight-range, baseHeight+range)
		speed = randf_range(1,5)
		#print("Height: "+str(height))
		#print("Speed: "+str(speed))
