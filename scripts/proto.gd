extends Node3D

@export var PEN: Pen
@export var UI: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	PEN.cow_entered_pen.connect(_on_cow_entered_pen)
	PEN.cow_left_pen.connect(_on_cow_left_pen)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cow_entered_pen():
	
	UI.update_herding_score(1)
	
func _on_cow_left_pen():
	
	UI.update_herding_score(-1)
