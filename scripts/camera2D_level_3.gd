extends Camera2D

@onready var rise_shake_timer = $"Rise Shake Timer"
@onready var sink_shake_timer = $"Sink Shake Timer"

var shouldShake:bool = false
var shakeStrength:float = 1

func _ready():
	offset = Vector2(0,0)

func _process(delta):
	if shouldShake:
		offset = Vector2(randf_range(-shakeStrength,shakeStrength),randf_range(-shakeStrength,shakeStrength))


func _on_rise_shake_timer_timeout():
	shouldShake = false
	offset = Vector2(0,0)

func _on_sink_shake_timer_timeout():
	shouldShake = false
	offset = Vector2(0,0)


func _on_platform_big_shake_screen_rise():
	shouldShake = true
	rise_shake_timer.start()

func _on_platform_big_shake_screen_sink():
	shouldShake = true
	sink_shake_timer.start()
