extends Camera2D

@onready var timer = $Timer

enum shakePosition {Left, Left2, Center, Right, Right2, Default, Shaked}
var state = shakePosition.Center

func _ready():
	pass 


func _process(delta):
	pass


func _on_door_can_not_access():
	print("signal_door_can_not_access")
	timer.start()


func _on_timer_timeout():
	print("timer_out")
	if(state==shakePosition.Center):
		state=shakePosition.Left
		offset.x=-2
		timer.start()
	elif(state==shakePosition.Left):
		state=shakePosition.Right
		offset.x=2
		timer.start()
	elif(state==shakePosition.Right):
		state=shakePosition.Left2
		offset.x=-2
		timer.start()
	#elif(state==shakePosition.Left2):
		#state=shakePosition.Right2
		#offset.x=2
		#timer.start()
	else:
		state=shakePosition.Center
		offset.x=0
	
	#if(state==shakePosition.Default):
		#state=shakePosition.Shaked
		#offset.x=-2
		#timer.start()
	#else:
		#state=shakePosition.Default
		#offset.x=0
