extends Area2D
@export var camera:Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		print("found")
		self.queue_free()
		camera.apply_shake(100,5)
		Global.red_obtained = true
		
