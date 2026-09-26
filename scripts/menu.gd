extends Node2D

@onready var menu_scene = preload("res://scenes/menu.tscn")
@onready var narrative_scene = preload("res://scenes/narrative_scene.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	
	GameOverlord.start_game()
