extends Node2D

#exports
@export var parent : Player
@export var body : CharacterBody2D
@export var sprite : Sprite2D
#shortcuts

#movement variables
const SPEED := 100.0
const JUMP_VELOCITY := -360.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var direction = Input.get_axis("mv_left", "mv_right")
	set_movement(direction, delta)
	if not parent.isDead:
		update_sprite_visuals(direction)
	
func set_movement(direction : float, delta : float):
	if not body.is_on_floor():
		body.velocity.y += gravity * delta

	if not parent.isDead:
		if Input.is_action_just_pressed("jump") and body.is_on_floor():
			body.velocity.y = JUMP_VELOCITY
			parent.jump_sound.play()
		if direction:
			body.velocity.x = direction * SPEED
		else:
			body.velocity.x = move_toward(body.velocity.x, 0, SPEED)

	body.move_and_slide()
	
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
