extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("RESET")
	#_on_body_entered(player)


func _process(delta):
	pass


func _on_body_entered(body):
	print("+1 Coin!")
	game_manager.addPoint()
	animation_player.play("collect")
