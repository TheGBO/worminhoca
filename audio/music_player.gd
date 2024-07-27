extends AudioStreamPlayer

@export var generic_tracks : Array[AudioStream]

func _ready():
	play_generic_track()

func play_generic_track():
	var random_song = generic_tracks.pick_random()
	if random_song != stream:
		stream = random_song
		play()
	else:
		#play_generic_track()
		pass

func _on_finished():
	play_generic_track()
	print("finished")
