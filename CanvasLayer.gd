extends CanvasLayer
@export var health:= 3
signal playerdead
@onready var green_crystal = $"Control2/Green Crystal"

# Called when the node enters the scene tree for the first time.
#func _ready():
	#if health == 3:
		#$Control2/Green_Crystal.visibile = false
func _ready():
	await get_tree().create_timer(5).timeout
	green_crystal.modulate = Color(1 ,1 ,1, 0.271)

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
