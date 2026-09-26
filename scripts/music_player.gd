extends AudioStreamPlayer

@onready var music_start = preload("res://assets/audio/music/Start.ogg")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _play_music(music: AudioStream, volume: float = 0.0) -> void:
	
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()


func play_music_start() -> void:
	
	_play_music(music_start)
