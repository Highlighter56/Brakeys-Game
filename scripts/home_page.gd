extends Node2D

@onready var ui = %Folder_UI
@onready var display_cloud_1 = %DisplayCloud
@onready var display_cloud_2 = %DisplayCloud2
@onready var display_cloud_3 = %DisplayCloud3
@onready var star_1 = %Star_1
@onready var star_2 = %Star_2
@onready var star_3 = %Star_3
@onready var credits_button = %Credits_Button

enum menus {QUIT, HOME, PLAY, CREDITS}
var currentMenu

func _ready():
	# Credit Button Visibility
	if(get_node("/root/LevelComplitionTracker").hasCompletedAllLevels()):
		credits_button.visible = true
	else:
		credits_button.visible = false
	
	# Cloud visibile
	display_cloud_1.visible = true
	display_cloud_2.visible = true
	display_cloud_3.visible = true
	
	# Which screen to display when loading HomePage
	if(get_node("/root/LevelComplitionTracker").gameStarted):
		if(get_node("/root/LevelComplitionTracker").hasCompletedAllLevels()):
			currentMenu = menus.CREDITS
			ui.position = Vector2(0,216)
		else:
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
			if(ui.position.x != 0 or ui.position.y !=0):
				#print("Moving to HOME")
				ui.position.x = move_toward(ui.position.x, 0, 5)
				ui.position.y = move_toward(ui.position.y,0,4)
		menus.QUIT:
			if(ui.position.x != 385):
				#print("Moving to QUIT")
				ui.position.x = move_toward(ui.position.x,385,5)
		menus.CREDITS:
			if(ui.position.x != 0 or ui.position.y !=216):
				#print("Moving to HOME")
				ui.position.x = move_toward(ui.position.x, 0, 5)
				ui.position.y = move_toward(ui.position.y,216,4)

func _physics_process(delta):
	pass

# Home Screen
func _on_play_button_pressed():
	currentMenu = menus.PLAY
	#print(currentMenu)

func _on_quit_button_pressed():
	currentMenu = menus.QUIT
	#print(currentMenu)

func _on_credits_button_pressed():
	currentMenu = menus.CREDITS

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


# Credits
func _on_to_main_menu_pressed():
	currentMenu = menus.HOME
