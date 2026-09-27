extends AudioStreamPlayer

@onready var sfx_ambient_desert_night = preload("res://assets/audio/sfx/Ambient_DesertNight.ogg")
@onready var sfx_ambient_desert_storm_and_rain = preload("res://assets/audio/sfx/Ambient_DesertStormandRain.ogg")
@onready var sfx_ambient_desert_sunny = preload("res://assets/audio/sfx/Ambient_DesertSunny.ogg")
@onready var sfx_ambient_desert_wind = preload("res://assets/audio/sfx/Ambient_DesertWind.ogg")
@onready var sfx_UI_click_button = preload("res://assets/audio/sfx/UI_ClicButton_Snap.mp3")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func play_button_click() -> void:
	
	stream = sfx_UI_click_button
	play()
