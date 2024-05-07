extends Control
@onready var score_counter = $ScoreCounter
@export var level_game_manager : LevelGameManager

func update_score_count():
	if level_game_manager != null:
		score_counter.text = "total score: " + str(level_game_manager.score) + "\n level: " + str(level_game_manager.score) + "/" + str(level_game_manager.level_max_score)
