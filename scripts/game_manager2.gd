extends Node

@onready var folder_coins = %Folder_Coins
@onready var player = %Player


var score = 0
@onready var coinCount = folder_coins.get_child_count()

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


func isComplete():
	return score/coinCount==1
