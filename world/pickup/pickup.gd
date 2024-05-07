extends Area2D

@onready var level_game_manager = %LevelGameManager
@onready var animation_player = $AnimationPlayer
@export var value : int = 1

func _on_body_entered(body):
	if body.is_in_group("Player"):
		animation_player.play("pickup")
	level_game_manager.add_score(value)
