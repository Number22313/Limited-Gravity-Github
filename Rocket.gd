extends Sprite2D
@onready var label = $Label
@export var camera:Camera2D
var crystal_count = 0
@onready var fuel_container = $"Fuel container"
var speed: float = -1.0
# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_just_pressed("fueling rocket") and Global.green_obtained and label.visible:
			print("animationed")
			fuel_container.play("default")
			Global.rocket_fueled = true
		
		if Global.rocket_fueled == true:
			await get_tree().create_timer(2).timeout
			Global.player_visible = 2
			Global.allowed_to_move = false
		
		if Global.allowed_to_move == false:
			self.position.y += speed
		

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		label.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false
