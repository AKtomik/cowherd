extends AudioStreamPlayer

@onready var music_start = preload("res://assets/audio/music/Theme4.ogg")
@onready var music_narration_intro_epilogues = preload("res://assets/audio/music/Church.ogg")
@onready var music_narration_interludes = preload("res://assets/audio/music/Start.ogg")


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

func play_music_narration(id: String) -> void:
	
		match id:
			"intro": _play_music(music_narration_intro_epilogues)
			"interlude1": _play_music(music_narration_interludes)
			"interlude2": _play_music(music_narration_interludes)
			"interlude3": _play_music(music_narration_interludes)
			"epilogues": _play_music(music_narration_intro_epilogues)
			
			_: printerr("Unknown narration id for MusicPlayer")
