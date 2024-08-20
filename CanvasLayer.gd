extends CanvasLayer
@export var health:= 3
signal playerdead
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health == 2:
		$Control/Health3.visible = false
	elif health == 1:
		$Control/Health2.visible = false
	elif health <= 0:
		$Control/Health3.visible = false
	if health <= 0:
		emit_signal("playerdead")
func _on_enemy_playerhurt():
	health -= 1
	print(health)
