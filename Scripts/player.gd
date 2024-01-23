extends CharacterBody2D

# Node references
@onready var animated_sprite = $AnimatedSprite2D

# Player states
var color: String
var speed = 100

func _ready():
	# Randomly assign it a color on spawn
	color = Global.color[randi() % Global.color.size()]

func _physics_process(delta):
	movement_input()
	move_and_slide()

# Player movement
func movement_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	# -------- Animations by color ------------
	#left anim
	if Input.is_action_pressed("ui_left"):
		animated_sprite.play(color + "_side")
		animated_sprite.flip_h = false
	#right anim
	elif Input.is_action_pressed("ui_right"):
		animated_sprite.play(color + "_side")
		animated_sprite.flip_h = true
	#up anim
	elif Input.is_action_pressed("ui_up"):
		animated_sprite.play(color + "_up")
	#down anim
	elif Input.is_action_pressed("ui_down"):
		animated_sprite.play(color + "_down")
	#idle anim
	else:
		animated_sprite.play(color + "_idle")
		animated_sprite.flip_h = false




#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
