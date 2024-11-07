extends Node
@onready var sign_text = $"DisplaySign/Sign Text"
@onready var folder_coins = %Folder_Coins
@onready var player = %Player
@onready var firework_1 = $Firework1
@onready var firework_2 = $Firework2
@onready var firework_3 = $Firework3

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
	sign_text.text = "Coins: " + str(score) + "/" + str(coinCount)
# If all coins have been collected, explode fire works
# This is in addPoint() instead of _process(delta) so less thigns are happening each frame
	if(isComplete()):
		firework_1.delay.start()
		firework_2.delay.start()
		firework_3.delay.start()

func isComplete():
	return score/coinCount==1
