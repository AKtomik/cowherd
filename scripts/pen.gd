extends Node3D
class_name Pen

signal cow_entered_pen
signal cow_left_pen

@export var XSIZE: int = 30
@export var ZSIZE: int = 30

@export var COLLISION: CollisionShape3D
@export var CORNER_TOPLEFT: MeshInstance3D
@export var CORNER_TOPRIGHT: MeshInstance3D
@export var CORNER_BOTTOMLEFT: MeshInstance3D
@export var CORNER_BOTTOMRIGHT: MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var penshape = COLLISION.shape
	penshape.size = Vector3(XSIZE, 1, ZSIZE)
	CORNER_TOPLEFT.position = Vector3(-XSIZE/2, 0, -ZSIZE/2)
	CORNER_TOPRIGHT.position = Vector3(XSIZE/2, 0, -ZSIZE/2)
	CORNER_BOTTOMLEFT.position = Vector3(-XSIZE/2, 0, ZSIZE/2)
	CORNER_BOTTOMRIGHT.position = Vector3(XSIZE/2, 0, ZSIZE/2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_area_entered(area: Area3D) -> void:
	print("enter pen: ", area)
	
	if area.is_in_group("cow_area"):
		cow_entered_pen.emit()
	

func _on_area_3d_area_exited(area: Area3D) -> void:
	
	print("leave pen: ", area)
	
	if area.is_in_group("cow_area"):
		cow_left_pen.emit()
