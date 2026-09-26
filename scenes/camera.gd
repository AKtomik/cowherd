extends Camera3D

@export var follow_node: Node3D
var position_difference: Vector3
@export var ALIGN_SPEED: float = .09

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position_difference = position - follow_node.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var ideal_position = follow_node.position + position_difference
	position = position.lerp(ideal_position, ALIGN_SPEED)
