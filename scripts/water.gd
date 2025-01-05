extends Node2D

var SPEED = 15
var leftBound = -512
@export var rightBound = (512-16)*7 # = 3472
# the -16 is to force overlap, to avoid blank spaces

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	# Moves Waves
	position.x = move_toward(position.x, -10000, SPEED*delta)
	# Loops
	if(position.x < leftBound):
		position.x = rightBound


