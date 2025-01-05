extends Node

@onready var sign_text = $"DisplaySign/Sign Text"
@onready var folder_coins = %Folder_Coins
@onready var player = %Player
@onready var firework_1 = $Firework1
@onready var firework_2 = $Firework2
@onready var firework_3 = $Firework3
@onready var door_delay_1 = $DoorDelay1
@onready var door_delay_2 = $DoorDelay2
@onready var door = %Door

var score = 0
@onready var coinCount = folder_coins.get_child_count()

signal levelComplete

func _ready():
	#.get_child_count() returns the number of children a node has
	#print(folder_coins.get_child_count())
	#Engine.time_scale=.1
	pass

func _process(delta):
	pass

func addPoint():
	score+=1
	print(score)
	sign_text.text = "Coins: " + str(score) + "/" + str(coinCount)
# If all coins have been collected, explode fire works
# This is in addPoint() instead of _process(delta) so less thigns are happening each frame
	if(isComplete()):
		firework_1.delay.start()
		firework_2.delay.start()
		firework_3.delay.start()

func isComplete():
	return score/coinCount==1


func _on_door_trigger_level_complete():
	#print("Game Manager")
	levelComplete.emit()
	door_delay_1.start()

func _on_door_delay_1_timeout():
	player.visible = false
	door.doorClose3()
	door_delay_2.start()

func _on_door_delay_2_timeout():
	get_node("/root/LevelComplitionTracker").completedLevelOne = true
	get_tree().change_scene_to_file("res://scense/Levels/home_page.tscn")
