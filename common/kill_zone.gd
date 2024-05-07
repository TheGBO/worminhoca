extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	if body.is_in_group("Player"):
		timer.start()
		Engine.time_scale = 0.25
		body.die()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
