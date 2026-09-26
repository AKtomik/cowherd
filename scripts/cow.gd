extends RigidBody3D

# physic
var real_direction: Vector3 = Vector3(0, 0, 0)
var real_speed: float = 0

# desire
var desired_direction: Vector3 = Vector3(0, 0, 0)
var desired_speed: float = 0

# phases
var panic_by: Array[Area3D] = []
var next_phase_in: float = 0


@export var IDLE_SPEED_MIN = 20
@export var IDLE_SPEED_MAX = 50
@export var PANIC_SPEED_MIN = 1000
@export var PANIC_SPEED_MAX = 2000

func _ready() -> void:
	pass

func idle_phase():
		desired_direction = Vector3(randf() * 2 -1, 0, randf() * 2 -1).normalized()
		desired_speed = randf_range(IDLE_SPEED_MIN, IDLE_SPEED_MAX)
		print("idle_phase: ", desired_direction, desired_speed)

func panic_phase():
		desired_direction = Vector3(panic_by[0].position.x - position.x, 0, panic_by[0].position.z - position.z).normalized()
		desired_speed = randf_range(PANIC_SPEED_MIN, PANIC_SPEED_MAX)
		print("panic_phase: ", desired_direction, desired_speed)

func _physics_process(delta: float) -> void:
	next_phase_in -= delta
	
	if (next_phase_in < 0):
		next_phase_in = randf_range(.5, 1.5)
		if (panic_by.size() > 0):
			panic_phase()
		else:
			idle_phase()

	# todo: cow velocity system
	real_direction = desired_direction
	real_speed = desired_speed

	look_at(position + real_direction)
	apply_force(delta * real_speed * Vector3(1, 0, 0))


func _on_panic_area_entered(area: Area3D) -> void:
	next_phase_in = randf_range(.5, 1.5)
	panic_by.append(area)
	panic_phase()

func _on_panic_area_exited(area: Area3D) -> void:
	panic_by.erase(area)
