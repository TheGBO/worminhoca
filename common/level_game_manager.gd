extends Node
class_name LevelGameManager

static var score = 0
var level_score = 0

@export var level_ui : Control
@export var death_animator : AnimationPlayer

@onready var death_reset_timer = $DeathResetTimer

func _ready():
	level_score = 0

func add_score(value):
	score += value
	level_score += value
	debug_score()
	
	
func death_procedure():
	Engine.time_scale = 0.5
	score -= level_score
	death_animator.play("fade_in")
	debug_score()
	death_reset_timer.start()
	
func _process(delta):
	level_ui.update_score_count()
	pass
	
func debug_score():
	print('score:' + str(score))
	print('lv_score:' + str(level_score))


func _on_death_reset_timer_timeout():
	Engine.time_scale = 1
	print('death processed')
	get_tree().reload_current_scene()
