extends CanvasLayer
@export var health:= 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_playerhurt():
	health -= 1
	print(health)
	visible = false
