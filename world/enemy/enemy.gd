extends Node2D

var moving_speed = 45
var direction_factor = 1
@onready var floor_detection_raycast = $FloorDetectionRaycast
@onready var wall_detection_raycast = $WallDetectionRaycast
@onready var attack_sound = $AttackSound

func _process(delta):
	position.x += moving_speed * direction_factor * delta
	if wall_detection_raycast.is_colliding() or !floor_detection_raycast.is_colliding():
		flip()
	
func flip():
	scale.x *= -1
	direction_factor *= -1


func _on_kill_zone_body_entered(body):
	if body.is_in_group("Player"):
		attack_sound.play()
