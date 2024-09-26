extends Sprite2D
@onready var label = $Label
@export var camera:Camera2D
var crystal_count = 0
@onready var fuel_container = $"Fuel container"
var speed: float = -10.0
# Called when the node enters the scene tree for the first time.
signal max_limit

func _ready():
	label.visible = true
	$CPUParticles2D.emitting = false
	Global.fuel_animation = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_just_pressed("fueling rocket") and Global.green_obtained and Global.red_obtained and label.visible:
			Global.rocket_fully_fueled = true
			$"Fuel container".play("fuel_sprite_animation")
			Global.rocket_flying += 1
				
		fuel_container.visible = true
		print(Global.fuel_animation)
		
		if Global.rocket_fueled == true:
			Global.player_visible = 2
			Global.allowed_to_move = false
		
		if Global.allowed_to_move == false:
			self.position.y += speed #currently flying\
		
		
		if Global.rocket_flying == 2:
			await get_tree().create_timer(4).timeout
			Global.rocket_fueled = true
			Global.rocket_fully_fueled = false
			label.visible = false
			Global.fuel_animation = false
			fuel_container.visible = false
			
		if Global.rocket_fueled == true:
			$CPUParticles2D.emitting = true

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		label.visible = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false
