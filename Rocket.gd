extends Sprite2D
@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		label.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false
