extends Sprite2D
@onready var label = $Label
@export var camera:Camera2D
var crystal_count = 0
@onready var fuel_container = $"Fuel container"

# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_just_pressed("fueling rocket") and Global.green_obtained:
			print("animationed")
			fuel_container.play("default")


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		label.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false
