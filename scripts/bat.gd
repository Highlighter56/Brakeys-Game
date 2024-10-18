extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft

#30-60 are good speeds
@export var SPEED = 45

var direction = 1


func _ready():
	pass

func _process(delta):
# Sets Direction
	if(ray_cast_right.is_colliding()):
		direction=-1
		animated_sprite_2d.flip_h = true
	if(ray_cast_left.is_colliding()):
		direction=1
		animated_sprite_2d.flip_h = false
		
# Explination of position function
	# direction: left or right
	# SPEED: amount of pixels to be moved
	# delta: compinsates for varying frame rates, 
	position.x += direction * SPEED * delta 
