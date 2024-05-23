extends BaseMovementComponent

@export var parent : BaseEnemy
@export var can_jump := true

var direction_factor = 1
@export var floorcast : RayCast2D
@export var wallcast : RayCast2D

func _process(delta):
	apply_movement(delta, direction_factor)
	
	var wcollider = wallcast.get_collider()
	var fcollider = floorcast.get_collider()
	
	if not (wcollider is CharacterBody2D or fcollider is CharacterBody2D):
		if not floorcast.is_colliding():
			if can_jump:
				jump()
			else:
				flip()
		if wallcast.is_colliding():
			flip()

func flip():
	parent.scale.x *= -1
	direction_factor *= -1
