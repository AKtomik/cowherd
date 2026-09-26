class_name Level
extends Node3D

@export var PEN: Pen
@export var UI: Control

@export var sun_node: DirectionalLight3D
@export var level_duration_seconds: float = 60
@export var level_progress_seconds: float = 0


func _ready() -> void:
	print("level ready!")


var cinematic = false
var started = false

func start():
	cinematic = false
	started = true

func level_end():
	print("level end!")
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _process(delta: float) -> void:
	if (started): level_progress_seconds += delta
	
	var progress = level_progress_seconds / level_duration_seconds
	sun_node.rotation.x = - progress * PI
	if (progress >= 1): level_end()

	
