extends Control
@onready var score_counter = $ScoreCounter
@export var level_game_manager : LevelGameManager

func update_score_count():
	score_counter.text = tr("UI_SCORE") + str(level_game_manager.score)
