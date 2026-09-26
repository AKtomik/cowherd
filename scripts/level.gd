class_name Level
extends Node3D

@export var pen_node: Pen
@export var ui_node: PlayUI
var score = 0

@export var sun_node: DirectionalLight3D
@export var level_duration_seconds: float = 60
@export var level_progress_seconds: float = 0

var cinematic = true
var started = false

# state
func start():
	cinematic = false
	started = true

func level_end():
	print("level end!")
	get_tree().change_scene_to_file("res://scenes/level.tscn")

# score
func add_score():
	score += 1
	ui_node.update_herding_score(score)

func remove_score():
	score -= 1
	ui_node.update_herding_score(score)

# loop
func _ready() -> void:
	pen_node.cow_enter_pen.connect(add_score)
	pen_node.cow_left_pen.connect(remove_score)
	print("level ready!")

func _process(delta: float) -> void:
	if (started): level_progress_seconds += delta
	
	var progress = level_progress_seconds / level_duration_seconds
	sun_node.rotation.x = - progress * PI
	if (progress >= 1): level_end()

	
