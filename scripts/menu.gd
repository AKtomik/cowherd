extends Node2D

@export var credits_layer: CanvasLayer

@onready var menu_scene = preload("res://scenes/menu.tscn")
@onready var narrative_scene = preload("res://scenes/narrative_scene.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	MusicPlayer.play_music_start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	
	GameOverlord.start_game()


func _on_credits_pressed() -> void:
	
	credits_layer.visible = true


func _on_quit_pressed() -> void:
	
	get_tree().quit()


func _on_return_pressed() -> void:
	
	credits_layer.visible = false
