extends Node2D

#exports
@export var parent : Player
@export var body : CharacterBody2D
@export var sprite : Sprite2D
#shortcuts

#movement variables
var min_speed = 100
var max_speed = 125
var speed = 100.0
var acceleration_rate = 275
var deceleration_rate = 750

#runtime variables
var last_direction : float
var direction : float

var jump_force = -360.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	direction = Input.get_axis("mv_left", "mv_right")
	set_movement(delta)
	if not parent.isDead:
		update_sprite_visuals(direction)
	
func set_movement(delta : float):
	if not body.is_on_floor():
		body.velocity.y += gravity * delta

	if not parent.isDead:
		if Input.is_action_just_pressed("jump") and body.is_on_floor():
			body.velocity.y = jump_force
			parent.jump_sound.play()
			
		if direction:
			last_direction = direction
			if speed < max_speed:
				speed += acceleration_rate * delta
			body.velocity.x = direction * speed
		else:
			body.velocity.x = move_toward(body.velocity.x, 0, deceleration_rate * delta)
			speed = min_speed
				

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
