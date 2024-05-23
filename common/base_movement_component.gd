extends Node2D

class_name BaseMovementComponent

@export var body : CharacterBody2D
@export var sprite : Sprite2D

@export var speed = 100.0
@export var jump_force = 360.0

#runtime variables
var last_direction : float
var direction : float

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func apply_movement(delta : float, x_axis):
	direction = x_axis
	
	if not body.is_on_floor():
		body.velocity.y += gravity * delta

	if direction:
		last_direction = direction
		body.velocity.x = direction * speed
	else:
		body.velocity.x = move_toward(body.velocity.x, 0, speed)
	body.move_and_slide()

func jump():
	if body.is_on_floor():
		body.velocity.y = -jump_force
