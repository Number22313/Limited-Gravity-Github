extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var max_jumps = 2
var start_position = Vector2(-1000, -1160)

func _physics_process(delta):
	# Add the gravity.
	if Input.is_action_just_pressed("stuff"):
		self.global_position = start_position
	
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("move_up") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_canvas_layer_playerdead():
	self.global_position = Vector2(-99,0)
