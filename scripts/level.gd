class_name Level
extends Node3D

@export var pen_node: Pen
@export var ui_node: PlayUI
var score = 0

@export var sun_node: DirectionalLight3D
@export var level_duration_seconds: float = 60
@export var level_progress_seconds: float = 0
@export var level_goal: int = 2

# state
var cinematic = true
var started = false
var ended = false

func setup():
	ui_node.visible = false

func start():
	cinematic = false
	started = true
	ui_node.visible = true

func level_end():
	print("level end!")
	ended = true
	if score >= level_goal:
		get_tree().change_scene_to_file("res://scenes/narrative_scene.tscn")
		Dialogic.start("interlude1")
	else:
		get_tree().reload_current_scene()

# score
func add_score():
	if (ended): return
	score += 1
	ui_node.update_herding_score(score)

func remove_score():
	if (ended): return
	score -= 1
	ui_node.update_herding_score(score)

# loop
func _ready() -> void:
	pen_node.cow_enter_pen.connect(add_score)
	pen_node.cow_left_pen.connect(remove_score)
	setup()
	print("level ready!")

func _process(delta: float) -> void:
	if (started): level_progress_seconds += delta
	
	ui_node.update_timer(level_progress_seconds, level_duration_seconds)
	
	var progress = level_progress_seconds / level_duration_seconds
	sun_node.rotation.x = - progress * PI
	if (progress >= 1): level_end()

	
