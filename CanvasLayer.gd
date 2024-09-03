extends CanvasLayer
@export var health:= 3
signal playerdead
@export var player: CharacterBody2D
@onready var green_crystal = $"Control2/Green Crystal"
@onready var fps_label = $FPSlabel

# Called when the node enters the scene tree for the first time.
#func _ready():
	#if health == 3:
		#$Control2/Green_Crystal.visibile = false
func _ready():
	green_crystal.modulate = Color(1 ,1 ,1, 0.133)

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
	if  Global.green_obtained:
		$"Control2/Green Crystal".modulate = Color(1 ,1 ,1)
	if  Global.red_obtained:
		$"Control2/Red Crystal".modulate = Color(1 ,1 ,1)
	fps_label.text = str("FPS ", Engine.get_frames_per_second())

func _on_enemy_playerhurt():
	health -= 1


func _on_death_pit_body_entered(body):
	health = 0
