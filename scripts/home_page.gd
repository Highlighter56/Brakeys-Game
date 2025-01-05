extends Node2D

@onready var ui = %Folder_UI
@onready var star_1 = %Star_1
@onready var star_2 = %Star_2
@onready var star_3 = %Star_3

enum menus {QUIT, HOME, PLAY}
var currentMenu

func _ready():
	# Handels after beating a level and going bakc to the home page, being on the level
	# select screen
	if(get_node("/root/LevelComplitionTracker").gameStarted):
		currentMenu = menus.PLAY
		ui.position.x = -385
	else:
		currentMenu = menus.HOME
		get_node("/root/LevelComplitionTracker").gameStarted = true
	
	# Star Visibility
	star_1.visible = false
	star_2.visible = false
	star_3.visible = false
	if(get_node("/root/LevelComplitionTracker").getCompletedLevelOne()):
		star_1.visible = true
	if(get_node("/root/LevelComplitionTracker").getCompletedLevelTwo()):
		star_2.visible = true
	if(get_node("/root/LevelComplitionTracker").getCompletedLevelThree()):
		star_3.visible = true

func _process(delta):
	#print(currentMenu)
	#print(ui.position.x > -384)
	
	# Switch Menus
	match currentMenu:
		menus.PLAY:
			if(ui.position.x != -385):
				#print("Moving to PLAY")
				ui.position.x = move_toward(ui.position.x,-385,5)
		menus.HOME:
			if(ui.position.x != 0):
				#print("Moving to HOME")
				ui.position.x = move_toward(ui.position.x, 0, 5)
		menus.QUIT:
			if(ui.position.x != 385):
				#print("Moving to QUIT")
				ui.position.x = move_toward(ui.position.x,385,5)

func _physics_process(delta):
	pass

# Home Screen
func _on_play_button_pressed():
	currentMenu = menus.PLAY
	#print(currentMenu)

func _on_quit_button_pressed():
	currentMenu = menus.QUIT
	#print(currentMenu)


# Level Select
func _on_level_one_button_pressed():
	get_tree().change_scene_to_file("res://scense/Levels/level_1.tscn")

func _on_level_two_button_pressed():
	get_tree().change_scene_to_file("res://scense/Levels/level_2.tscn")

func _on_level_three_button_pressed():
	get_tree().change_scene_to_file("res://scense/Levels/level_3.tscn")

func _on_main_menu_button_pressed():
	currentMenu = menus.HOME
	#print(currentMenu)


# Quit Screen
func _on_quit_no_pressed():
	currentMenu = menus.HOME
	#print(currentMenu)

func _on_quit_yes_pressed():
	get_tree().quit()
