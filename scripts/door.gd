extends Node2D

@onready var game_manager = %GameManager
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sound_door_open = $SoundDoorOpen
@onready var sound_door_close = $SoundDoorClose
@onready var tap = $tap
@onready var delay_close_sound = $DelayCloseSound
@onready var delay_open_close = $DelayOpenClose
@onready var error = $error

signal canNotAccess

# False=Closed	Ture=Opem
var state = false
var currentBody = null
var animating = false
var erroring = false

func _ready():
	set_modulate(Color.GRAY)

func _process(delta):
	# Interact
	if(currentBody!=null):
		if(!erroring):
			if(!animating and Input.is_action_just_pressed("interact")):
				if(game_manager.isComplete()):
					if(state):
						doorClose3()
					else:
						doorOpen()
					state=!state
				else:
					erroring=true
					canNotAccess.emit()
					error.play()

func doorOpen():
	animating = true
	tap.play()
	animated_sprite_2d.play("PartOpen")
	sound_door_open.play()

func doorClose3():
	animating = true
	tap.play()
	animated_sprite_2d.play("PartClose")
	delay_close_sound.start()

func _on_delay_close_sound_timeout():
	sound_door_close.play()

func _on_area_2d_body_entered(body):
	currentBody = body
# In order to show what you are interacting with, Im changing the modualtion of the door as the player enters
# the Area2D to a lighter shade. By default, they door will appear darker
	set_modulate(Color.WHITE)

func _on_area_2d_body_exited(body):
	set_modulate(Color.GRAY)
	currentBody = null

func _on_animated_sprite_2d_animation_finished():
	delay_open_close.start()

func _on_delay_open_close_timeout():
	animating = false

func _on_error_finished():
	erroring=false
