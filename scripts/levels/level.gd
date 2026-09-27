class_name Level
extends Node3D

@export_group("propeties")
@export var duration_seconds: float = 60
@export var progress_seconds: float = 0
@export var score_goal: int = 2
var score_current = 0

@export_group("links")
@export var sun_node: DirectionalLight3D
@export var pen_node: Pen
@export var ui_node: PlayUI

@export_group("next")
@export var scene_success: PackedScene
@export var dialog_success: DialogicTimeline
@export var scene_failure: PackedScene
@export var dialog_failure: DialogicTimeline

# state
var cinematic = true
var started = false
var ended = false

func setup():
	ui_node.visible = false
	ui_node.update_herding_score(score_current, score_goal)

func start():
	cinematic = false
	started = true
	ui_node.visible = true
	print("level started!")

func level_end():
	print("level end! ", score_current, "/", score_goal)
	GameOverlord.set_last_score(score_current)
	ended = true
	if score_current >= score_goal:
		if (scene_success): get_tree().change_scene_to_packed(scene_success)
		if (dialog_success): Dialogic.start(dialog_success)
	else:
		if (scene_failure): get_tree().change_scene_to_packed(scene_failure)
		if (dialog_failure): Dialogic.start(dialog_failure)

# score_current
func add_score():
	if (ended): return
	score_current += 1
	ui_node.update_herding_score(score_current, score_goal)

func remove_score():
	if (ended): return
	score_current -= 1
	ui_node.update_herding_score(score_current, score_goal)

# loop
func _ready() -> void:
	pen_node.cow_enter_pen.connect(add_score)
	pen_node.cow_left_pen.connect(remove_score)
	setup()
	print("level ready!")

func _process(delta: float) -> void:
	if (started && !ended): progress_seconds += delta
	
	ui_node.update_timer(progress_seconds, duration_seconds)
	
	var progress = progress_seconds / duration_seconds
	sun_node.rotation.x = - progress * PI
	if (progress >= 1 && !ended): level_end()

	
