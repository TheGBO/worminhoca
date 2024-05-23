extends Area2D

const LEVEL_ROOT_PATH = "res://level/level_"
@onready var level_game_manager = %LevelGameManager

func _ready():
	print(level_game_manager == null)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		call_deferred("load_next_level")
		
func load_next_level():
	var current_scene : String = get_tree().current_scene.scene_file_path
	var next_level_index : int = current_scene.to_int() + 1
	get_tree().change_scene_to_file(LEVEL_ROOT_PATH + str(next_level_index) + ".tscn")
