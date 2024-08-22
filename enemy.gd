extends CharacterBody2D
#gorilla code
@export var camera:Camera2D
var SPEED = 100
#var GRAVITY = 1000  
var chase: bool
var start_position2 = Vector2(0, 0)
@export var player: CharacterBody2D
signal Playerhurt

func _ready():
	chase = true
func _physics_process(delta):
# Calculate direction towards player
	if chase:
		var direction = (player.global_position - global_position).normalized()
		global_position += direction * SPEED * delta
		var knockback = position.direction_to(player.position) * -500
		velocity = knockback

#func detectenemy():
	#for body.get_overlapping_bodies():


	
#Shaking screen and sending player back to start when dead
func _on_area_2d_body_entered(body):
	print("dead")
	if body.is_in_group("player"):
		chase = true
		#camera.apply_shake(100,5)
		emit_signal("Playerhurt")


func _on_handle_death_body_entered(body):
	if body.is_in_group("player"):
		self.queue_free()
		chase = true
