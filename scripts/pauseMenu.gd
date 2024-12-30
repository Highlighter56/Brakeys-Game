extends Control

#@onready var player = %Player

var paused = false

func _ready():
	visible = false

func _process(delta):
	#if Input.is_action_just_pressed("ui_cancel"):
		#print(get_tree().current_scene.name)
# If the 'esc' key si pressed and your not on the home page, show the pause menu
	if Input.is_action_just_pressed("ui_cancel") and get_tree().current_scene.name!="HomePage":
		#If game is paused
		if(not paused):
			gamePaused()
		#If game is NOT paused
		else:
			gameUnpaused()

func gameUnpaused():
	print("Game UnPaused")
	paused = false
	Engine.time_scale = 1
	visible = false

func gamePaused():
	print("Game Paused")
	paused = true
	Engine.time_scale = 0
	visible = true


func _on_level_one_button_pressed():
	gameUnpaused()
	get_tree().change_scene_to_file("res://scense/Levels/level_1.tscn")

func _on_level_two_button_pressed():
	gameUnpaused()
	get_tree().change_scene_to_file("res://scense/Levels/level_2.tscn")

func _on_level_three_button_pressed():
	gameUnpaused()
	get_tree().change_scene_to_file("res://scense/Levels/level_3.tscn")

func _on_main_menu_button_pressed():
	gameUnpaused()
	get_tree().change_scene_to_file("res://scense/Levels/home_page.tscn")
