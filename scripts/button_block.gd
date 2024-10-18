extends StaticBody2D

@onready var animation_player = $AnimationPlayer

# Used to connect the Button to the Button Block
# Creates assigns a variable to the path to the node
@export var source_path: NodePath
# Assigns a variable to the node at the specified path
@onready var source = get_node(source_path)

func _ready():
	animation_player.play("RESET")

func _process(delta):
	#print(source)
	if(source!=null):
		if(source.getState()):
			animation_player.play("Triggered")
