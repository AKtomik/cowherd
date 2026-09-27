extends Node

@onready var menu_scene = preload("res://scenes/ui/menu.tscn")
@onready var narrative_scene = preload("res://scenes/narrative/narrative_scene.tscn")
@onready var level_scene_1 = preload("res://scenes/levels/level1.tscn")
@onready var level_scene_2 = preload("res://scenes/levels/level2.tscn")
@onready var game_over_scene = preload("res://scenes/narrative/game_over.tscn")

var game_over_text = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start_game() -> void:
	
	get_tree().change_scene_to_packed(narrative_scene)
	Dialogic.start("intro")


func switch_to_level(id: int):
	print("switch to level ", id)
	match id:
		1: get_tree().change_scene_to_packed(level_scene_1)
		2: get_tree().change_scene_to_packed(level_scene_2)
		_: printerr("Unknown level id")


func game_over(id: int) -> void:
	
	await get_tree().change_scene_to_packed(game_over_scene)
	
	if id == 0:
		game_over_text = "Mort par la main de ton père."
	
	
