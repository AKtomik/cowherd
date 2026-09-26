extends Node3D

@export var PEN: Pen
@export var UI: Control

@export var sun_node: DirectionalLight3D
@export var level_duration_seconds: float = 60
@export var level_progress_seconds: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level start!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level_progress_seconds += delta
	var progress = level_progress_seconds / level_duration_seconds
	sun_node.rotation.x = - progress * PI
	if (progress >= 1): level_end()

func level_end():
	print("level end!")
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
