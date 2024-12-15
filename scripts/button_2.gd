extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var hitbox = $hitbox
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

signal buttonPressed

var pressed = false

func _ready():
	animated_sprite_2d.play("idle_green")

func _process(delta):
	pass

func _on_detection_area_body_entered(body):
	#print("Body Detected, y.velocity: "+str(body.velocity.y))
	if(!pressed and body.velocity.y >= 0):
		pressed = true
		audio_stream_player_2d.play()
		animated_sprite_2d.play("pressed_green")
		hitbox.queue_free()
		buttonPressed.emit()
		#print("Button_2 Pressed")
