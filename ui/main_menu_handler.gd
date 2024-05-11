extends Node

func change_locale(locale_ID : String):
	TranslationServer.set_locale(locale_ID)


func _on_lang_pt_pressed():
	change_locale("pt")


func _on_lang_en_pressed():
	change_locale("en")


func _on_lang_es_pressed():
	change_locale("es")

#TODO: Save & Load levels + add functionality to credits and settings.
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://level/level_1.tscn")
