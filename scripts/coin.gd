extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

#@onready var player = %Player

# Called when the node enters the scene tree for the first time.
# A node enters the scene tree when the game starts
func _ready():
	animation_player.play("RESET")
	#_on_body_entered(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("+1 Coin!")
	game_manager.addPoint()
	animation_player.play("collect")
	#quee_free() removes the coin from the curent seen
