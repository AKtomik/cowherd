extends CharacterBody3D


@export var SPEED_MAX = 10.0
@export var SPEED_ACCELERATION = .7
@export var SPEED_DECELERATION = .05

@export var visual_rotated: Node3D

var last_facing: Vector2

func _physics_process(delta: float) -> void:
	if not is_on_floor(): velocity += get_gravity() * delta

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * SPEED_MAX, SPEED_ACCELERATION)
		velocity.z = move_toward(velocity.z, direction.z * SPEED_MAX, SPEED_ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED_DECELERATION)
		velocity.z = move_toward(velocity.z, 0, SPEED_DECELERATION)
	
	var facing = last_facing
	if velocity:
		facing = Vector2(velocity.x, velocity.z).normalized()
		last_facing = facing
	else:
		facing = last_facing
	
	#print("facing:", facing, facing.angle(), visual_rotated.rotation)
	visual_rotated.rotation.y = -facing.angle() + PI / 2

	move_and_slide()
