extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var player = %Player
@onready var delay = $delay

@export var xStart = 0
@export var yStart = 0
@export var xEnd = 0
@export var yEnd = 0
@export var time = 0.0

# When the scene is loaded, the displacment amount will be generated
var displacment = Vector2(randi_range(-20,20),randi_range(-40,-15))

func _ready():
	animated_sprite_2d.visible = false
# Will set the time on the timer
	delay.wait_time = time

func _process(delta):
	pass

func explode():
	# Position
	position = player.position + displacment
	# Explode
	animated_sprite_2d.visible = true
	animated_sprite_2d.play("boom")
	audio_stream_player_2d.play()

func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.visible = false


func _on_delay_timeout():
	explode()
