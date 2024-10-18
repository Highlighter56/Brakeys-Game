#To create you own 'actions' you can go to Project, Project Settings, Input Map.


extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var jump = $Jump

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var isDead = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func hasDied():
	isDead = true

func _ready():
	isDead = false

# Gets called every frame
func _process(delta):
	pass

# Gets called consintently, so physics works as it should (by default 60 tiems per second)
func _physics_process(delta):
	# Add Gravity
	if(not is_on_floor()):
		velocity.y += gravity * delta

	# Handles Jumps
	if(Input.is_action_just_pressed("jump") and is_on_floor()):
		jump.play()
		velocity.y = JUMP_VELOCITY

	# get_axis("Negative Value", "Positive Value")
	# Gets the input direction
	var direction = Input.get_axis("move_left", "move_right")
	
	# If the player is NOT dead
	if(!isDead):
		#print(position.y)
		
		# Flips Direction of Character
		if(direction>0):
			animated_sprite_2d.flip_h = false
		elif(direction<0):
			animated_sprite_2d.flip_h = true
		
		# Animations
		if(is_on_floor()):
			if(direction==0):
				animated_sprite_2d.play("idle")
			else:
				animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("jump")
		
		# Applys Movment / Sets Velocity
		if(direction):
			velocity.x = direction * SPEED
		else:
# move_towards(From, To, Delta) : will add/subtract delta to from in the direction to reach to
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# If the player IS dead
	else:
		animated_sprite_2d.play("die")
		if(position.y>256):
			velocity.x=0
	
# move_and_slide() moves the node based on its set velocity
	move_and_slide()
