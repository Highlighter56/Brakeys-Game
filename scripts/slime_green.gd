extends Node2D

# To create a reference to a node simple drag the node inot the script, and hold ctrl while releasing click
@onready var ray_cast_right = $RayCast_Right
@onready var ray_cast_left = $RayCast_Left
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 60
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding() or ray_cast_left.is_colliding():
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		direction*=-1
	position.x += direction * SPEED * delta
