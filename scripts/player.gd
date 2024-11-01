#To create you own 'actions' you can go to Project, Project Settings, Input Map.


extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var jump = $Jump

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var direction=0
var isDead = false
# for the State Machine - the are capitlas because they are treated as constants
enum state {DEAD, IDLE, RUNNING, JUMPING, SLIDING, FALLING}
var currentState
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func hasDied():
	isDead = true


func _ready():
	pass

# Gets called every frame
func _process(delta):
	# State Machine 
	#- I dont know if this is actualy what a state machine is, but
	# my State Machine is used to keep track of what state the player is in. I put 
	# this here instead of in the _physics_process because I want to leave that for 
	# physics, and this should be being called more frequently anyways, so this will 
	# work
	if(!isDead):
		if(!is_on_floor()):
			if(velocity.y >= 0):
				currentState = state.FALLING
				if(is_on_wall() and direction != 0):
					currentState = state.SLIDING
			else:
				currentState = state.JUMPING
		else:
			if(direction == 0):
				currentState = state.IDLE
			else:
				currentState = state.RUNNING
	else:
		currentState = state.DEAD
	#print(currentState)


# Gets called consintently, so physics works as it should (by default 60 tiems per second)
func _physics_process(delta):
	
	#print("Current:" + str(currentState))
	match currentState:
		state.DEAD:
			#print("State: DEAD")
			animated_sprite_2d.play("die")
			velocity.y += gravity * delta
			if(position.y>256):
				velocity.x=0
			velocity.x = move_toward(velocity.x, 0, 1)
			
		state.IDLE:
			#print("State: IDLE")
			animated_sprite_2d.play("idle")
			
		state.RUNNING:
			#print("State: RUNNING")
			animated_sprite_2d.play("run")
			
		state.JUMPING:
			#print("State: JUMPING")
			velocity.y += gravity * delta
			animated_sprite_2d.play("jump")
			
		state.SLIDING:
			#print("State: SLIDING")
			velocity.y=50
			
		state.FALLING:
			#print("State: FALLING")
			velocity.y += gravity * delta
	
	# Handles Direction
	# get_axis("Negative Value", "Positive Value")
	# Gets the input direction
	direction = Input.get_axis("move_left", "move_right")
	
	# Handles Jumps
	if(Input.is_action_just_pressed("jump")):
		if(currentState==state.IDLE or currentState==state.RUNNING or currentState==state.SLIDING):
			jump.play()
			velocity.y = JUMP_VELOCITY
	
	# Handles Player Controls and Disables Controls when Dead
	if(!isDead):
		# Flips Direction of Character
		if(direction>0):
			animated_sprite_2d.flip_h = false
		elif(direction<0):
			animated_sprite_2d.flip_h = true
		
		# Applys Movment / Sets Velocity
		if(direction):
			velocity.x = direction * SPEED
		else:
# move_towards(From, To, Delta) : will add/subtract delta to from in the direction to reach to
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
# move_and_slide() moves the node based on its set velocity
	move_and_slide()
