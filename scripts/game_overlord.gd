extends Node

@onready var menu_scene = preload("res://scenes/menu.tscn")
@onready var narrative_scene = preload("res://scenes/narrative_scene.tscn")
@onready var level_scene = preload("res://scenes/level.tscn")


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
	print(id)
	if id == 1:
		get_tree().change_scene_to_packed(level_scene)
		
	else:
		printerr("Unknown level id")


func game_over() -> void:
	
	get_tree().change_scene_to_packed(menu_scene)
	
	
