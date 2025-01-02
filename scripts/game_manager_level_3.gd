extends Node

signal level_complete

func _ready():
	# True, the level is not complete when you first open it, but to reuse the code for door 2, 
	# this is a super simple solution
	#level_complete.emit()
	pass
	
# Even though Im not keeping track of coin count in this level, I need this funcion
# here otherwise Id have to create a new coin script
func addPoint():
	pass


