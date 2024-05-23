extends BaseMovementComponent

#exports
@export var parent : Player

func _physics_process(delta):
	
	apply_movement(delta, Input.get_axis("mv_left", "mv_right"))
	if not parent.isDead:
		update_sprite_visuals(direction)
		if Input.is_action_just_pressed("jump"):
			jump()
	
func update_sprite_visuals(direction : float):
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	if body.is_on_floor():
		if direction == 0:
			parent.animator.play("idle")
		else:
			parent.animator.play("run")
	else:
		parent.animator.play("air")
