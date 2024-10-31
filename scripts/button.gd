extends StaticBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var button_hitbox = $ButtonHitbox
@onready var detection_zone = $DetectionZone
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

# state = false == button NOT pressed
# state = true == button IS pressed
var state = false
var currentBody = null

func getState():
	return state

func _ready():
	animated_sprite_2d.play("Default")
	button_hitbox.disabled = false

func _process(delta):
	if(!state):
		if(currentBody!=null):
			#print(currentBody.velocity.y)
			# Determinds whether the button will be hit from above or from below
			if(currentBody.velocity.y>=0):
				buttonPressed()

# Technicaly this function could be an animation player instead
func buttonPressed():
	state=true
	animated_sprite_2d.play("Pressed2")
	button_hitbox.disabled = true
	audio_stream_player_2d.play()

func _on_area_2d_body_entered(body):
	currentBody = body

func _on_detection_zone_body_exited(body):
	currentBody = null
