class_name Player

extends CharacterBody2D

@onready var collider = $CollisionShape2D
@onready var jump_sound = $JumpSound
@onready var animator = $Animator
@onready var player_movement = $PlayerMovement

@onready var death_sound = $DeathFX/DeathSound
@onready var death_collider_timer = $DeathFX/DeathColliderTimer
@onready var death_particle = $DeathFX/DeathParticle

var isDead : bool = false
const DEATH_JUMP = -350

func die():
	#check to not call the death function recursively after death
	if isDead:
		return
	isDead = true
	%LevelGameManager.death_procedure()
	
	#audio and visual effects of death
	death_particle.emitting = true
	death_sound.play()	
	death_collider_timer.start()
	animator.play("death")
	velocity.y = DEATH_JUMP
	
func _on_death_collider_timer_timeout():
	collider.queue_free()
