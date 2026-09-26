extends RigidBody3D

@export var cow_mesh: MeshInstance3D
@export var cow_shape: CollisionShape3D

# physic
var real_direction: Vector3 = Vector3(0, 0, 0)
var real_speed: float = 0

# desire
var desired_direction: Vector3 = Vector3(0, 0, 0)
var desired_speed: float = 0

# phases
var panic_by: Array[Area3D] = []
var next_phase_in: float = 0


@export var IDLE_PUSH_MIN = 1
@export var IDLE_PUSH_MAX = 3
@export var PANIC_PUSH_NEAR = 500

func _ready() -> void:
	pass

func idle_phase():
	# called when next phase
	desired_direction = Vector3(randf() * 2 -1, 0, randf() * 2 -1).normalized()
	desired_speed = randf_range(IDLE_PUSH_MIN, IDLE_PUSH_MAX)
	#print("idle_phase: ", desired_direction, desired_speed)

func panic_phase():
	# called every frame
	# ! do not support multilple panic sources
	var panic_distance = Vector2(panic_by[0].position.x - position.x, panic_by[0].position.z - position.z)
	desired_direction = Vector3(-panic_distance.x, 0, -panic_distance.y).normalized()
	desired_speed = PANIC_PUSH_NEAR / panic_distance.length()
	#print("panic_phase: ", desired_direction, desired_speed)

func _physics_process(delta: float) -> void:
	next_phase_in -= delta
	
	if (panic_by.size() > 0):
		panic_phase()
		# why it is affecting all of them at same time?:
		cow_shape.debug_color = Color(1, 0, 0, .3)
	elif (next_phase_in < 0):
		next_phase_in = randf_range(.5, 1.5)
		idle_phase()
		# why it is affecting all of them at same time?:
		cow_shape.debug_color = Color(0, 1, 0, .3)

	# todo: direction velocity system
	real_direction = desired_direction
	real_speed = desired_speed

	look_at(position + real_direction)
	apply_central_force(-transform.basis.z * real_speed)


func _on_panic_area_entered(area: Area3D) -> void:
	print("enter:", self, area)
	panic_by.append(area)

func _on_panic_area_exited(area: Area3D) -> void:
	print("exit:", self, area)
	panic_by.erase(area)
