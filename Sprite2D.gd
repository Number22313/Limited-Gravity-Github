extends Sprite2D
var health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _on_enemy_player_dies():
	#self.visible = false
	
func _on_enemy_player_dies():
	self.visible = false
	print("hidden")
