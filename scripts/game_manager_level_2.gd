extends Node

@onready var win_zone = $Win_Zone
@onready var player = %Player
@onready var door = $Door2
@onready var delay_1 = $delay1
@onready var delay_2 = $delay2
@onready var delay_3 = $delay3
@onready var delay_4 = $delay4

var movePlayer = false
var playerDirection

signal levelComplete

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	# This code is to control the player during the cut scene
	if(!movePlayer and player.currentState == player.state.COMPLETE):
		player.velocity.x = 0
		player.move_and_slide()
		if(player.is_on_floor()):
			player.animated_sprite_2d.play("idle")
	if(movePlayer):
		player.animated_sprite_2d.play("run")
		# If player is left of door
		if(player.position.x < door.position.x):
			player.animated_sprite_2d.flip_h = false
			playerDirection = 1
		else:
			player.animated_sprite_2d.flip_h = true
			playerDirection = -1
		# Move the player until the end scene is done
		player.velocity.x = playerDirection * 50
		player.move_and_slide()
		if(player.position.x <= door.position.x+8 and player.position.x >= door.position.x-8):
			movePlayer = false
			player.visible = false
			delay_2.start()
			#print("Here")
			# End Scene Code Jumps Back to the bottom train


# Even though Im not keeping track of coin count in level 2, I need this funcion
# here otherwise Id have to create a new coin object/script
func addPoint():
	pass

func _on_win_zone_body_entered(body):
	emit_signal("levelComplete")
	delay_4.start()

func _on_door_2_has_opened():
	emit_signal("levelComplete")


# Starts End Game Cut Scene
func _on_level_complete():
	delay_1.start()
func _on_cinematic_timer_timeout():
	door.animation_open_door()
func _on_door_2_door_is_done_opening():
	movePlayer = true
	# Cut Scene code jumps into _physics_process()
# From player control back to door control
func _on_delay_2_timeout():
	door.animation_close_door()
	# There is a looping error in the code, so my idea is to leave the scene 
	# before the user can notice the loop
	delay_3.start()
func _on_delay_3_timeout():
	#print("Timer 3: LEAVE LEVEL 2 NOW")
	# This access the LCT, and then updates the completion state
	get_node("/root/LevelComplitionTracker").completedLevelTwo = true
	get_tree().change_scene_to_file("res://scense/Levels/home_page.tscn")

func _on_delay_4_timeout():
	#print("Timer 4: Fail Safe")
	get_node("/root/LevelComplitionTracker").completedLevelTwo = true
	get_tree().change_scene_to_file("res://scense/Levels/home_page.tscn")
