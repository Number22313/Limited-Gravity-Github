extends CharacterBody2D

@onready var rocket = $"../Rocket"

const SPEED = 250.0

const JUMP_VELOCITY = -400

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var max_jumps = 2
var start_position = Vector2(-1000, -1160)

func _process(delta):
	# Add the gravity.
	if Input.is_action_just_pressed("green crystal tp"):
		self.global_position = start_position
	if Input.is_action_just_pressed("red crystal tp"):
		Global.red_obtained = true
	if Input.is_action_just_pressed("tp to rocket"):
		self.global_position = Vector2(0,0)
	
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("move_up") and jump_count < max_jumps and Global.allowed_to_move:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		
	if Global.player_visible == 2:
		self.z_index = -1
		Global.chase = false
	
	if Global.allowed_to_move == false:
		self.global_position = rocket.global_position
		$AnimatedSprite2D.visible = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction and (Global.allowed_to_move == true):
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _on_canvas_layer_playerdead():
	get_tree().change_scene_to_file("res://dead.tscn")
