extends Area2D
# @export allows the node to be assigned through the Inspector Tab
@export var label_node: NodePath
# The get_node() funciton can only be called after _ready / after the scene tree has been created. By 
# using the key phrase @onready, this makes it so once the _ready() function is called that this variable
# gets assigned. I could just place this statment inside the _ready() function, but then I was having 
# the issue where label wasnt defined within the scope of the other methods. 
@onready var label = get_node(label_node)	

func _ready():
	label.visible = false

func _process(delta):
	#print(label)
	pass

func _on_body_entered(body):
	label.visible = true

func _on_body_exited(body):
	label.visible = false
