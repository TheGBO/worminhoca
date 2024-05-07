extends Node
class_name LevelGameManager

static var score = 0
var level_score = 0
var level_max_score = 0

@onready var level_ui = $CanvasLayer/LevelUI
@onready var animator = $CanvasLayer/DeathUI/Animator

func _ready():
	level_score = 0

func add_score(value):
	score += value
	level_score += value
	debug_score()
	
	
func death_procedure():
	score -= level_score
	animator.play("fade_in")
	debug_score()
	print('death processed')
	
func _process(delta):
	level_ui.update_score_count()
	pass
	
func debug_score():
	print('score:' + str(score))
	print('lv_score:' + str(level_score))
