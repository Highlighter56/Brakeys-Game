extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

signal hasOpened
signal doorIsDoneOpening

var isClosed = true
var isAnimating = false
var inRange = false
var levelComplete = false

func _ready():
	set_modulate(Color.GRAY)

func _process(delta):
	if(!levelComplete and inRange and !isAnimating and Input.is_action_just_pressed("interact")):
		emit_signal("hasOpened")
		isAnimating = !isAnimating
		if(isClosed):
			#print("Door Opens")
			animation_player.play("Open_Door_Animation")
			isClosed = false
		else:
			#print("Door Closes")
			animation_player.play("Close_Door_Animation")
			isClosed = true
		#print(isClosed)

# Plays Animation Swquence for Animation Player
func animation_open_door():
	animated_sprite_2d.play("open_door")
func animation_close_door():
	animated_sprite_2d.play("close_door")

# Unlocks Interactability
func _on_animated_sprite_2d_animation_finished():
	isAnimating = !isAnimating
	#print("Door State: "+str(isClosed))
	if(isClosed):
		emit_signal("doorIsDoneOpening")

# Detect when the player enters the area
func _on_area_2d_body_entered(body):
	inRange = true
	set_modulate(Color.WHITE)
	#print("In Range")
func _on_area_2d_body_exited(body):
	inRange = false
	set_modulate(Color.GRAY)
	#print("Out of Range")


func _on_game_manager_level_complete():
	levelComplete = true
