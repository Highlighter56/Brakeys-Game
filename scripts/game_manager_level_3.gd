extends Node

@onready var door = %Door2
@onready var door_delay_1 = $DoorDelay1
@onready var door_delay_2 = $DoorDelay2
@onready var player = %Player

signal levelComplete

# Even though Im not keeping track of coin count in this level, I need this funcion
# here otherwise Id have to create a new coin script
func addPoint():
	pass


func _ready():
	pass

func _process(delta):
	pass

func _on_door_2_triggering_level_completion():
	levelComplete.emit()
	door_delay_1.start()

func _on_door_delay_1_timeout():
	player.visible = false
	door.doorCloseFunction()
	door_delay_2.start()

func _on_door_delay_2_timeout():
	get_node("/root/LevelComplitionTracker").completedLevelThree = true
	get_tree().change_scene_to_file("res://scense/Levels/home_page.tscn")
