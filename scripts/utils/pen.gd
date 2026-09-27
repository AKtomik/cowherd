extends Node3D
class_name Pen

signal cow_enter_pen
signal cow_left_pen

@export var COLLISION: CollisionShape3D
var areas_in: Array[Node3D]

func on_body_enter_pen(body: Node3D) -> void:
	if not (body.is_in_group("cows") and body not in areas_in): return
	areas_in.append(body)
	print("+1 cow: ", body)
	cow_enter_pen.emit()

func on_body_exit_pen(body: Node3D) -> void:
	if not (body.is_in_group("cows") and body in areas_in): return
	areas_in.erase(body)
	print("-1 cow: ", body)
	cow_left_pen.emit()
