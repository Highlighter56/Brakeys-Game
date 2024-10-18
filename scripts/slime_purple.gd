extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var down_right = $DownRight
@onready var down_left = $DownLeft

@export var SPEED = 60
var direction = 1
var flipping = false

func _ready():
	pass

func _process(delta):
	position.x += SPEED * direction * delta
	#print(flipping)
	if(!flipping):
		flip()
	elif(down_right.is_colliding() and down_left.is_colliding()):
		flipping=false

func flip():
	if(!down_right.is_colliding() or !down_left.is_colliding()):
		#print("Right: "+str(!down_right.is_colliding())+" Left: "+str(!down_left.is_colliding()))
		direction*=-1
		animated_sprite_2d.flip_h=!animated_sprite_2d.flip_h
		flipping=true
