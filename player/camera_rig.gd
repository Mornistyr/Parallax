class_name CameraRig
extends Node3D


# PC vars
@export var yaw_pivot: Node3D
@export var pitch_pivot: Node3D

@export_range(0.001, 1.0)
var mouse_sensitivity := 0.003

@export_range(-89.0, 0.0)
var min_pitch := -80.0

@export_range(0.0, 89.0)
var max_pitch := 80.0

var yaw := 0.0
var pitch := 0.0

# Mobile vars
var current_rotation: Vector3 = Vector3.ZERO
var is_mobile = false

func _ready():
	
#	For now handling mobile & pc in same class, split later if more logic. 
#	Seperate camera node for pc / android, swap it out in GlobalScript
	if GameEvents.is_mobile():
		is_mobile = true
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

		yaw = yaw_pivot.rotation.y
		pitch = pitch_pivot.rotation.x

func _physics_process(delta: float) -> void:
	
#	Currently mobile is the only one that uses the physics process, skip logic if not mobile
	if not is_mobile: return 
	
	# Get the angular velocity in rad/s
	var gyro_velocity: Vector3 = Input.get_gyroscope()
	
	# Integrate velocity over time to get rotation
	current_rotation += gyro_velocity * delta
	
	# Apply to your object
	rotation = current_rotation


func _input(event: InputEvent) -> void:
#	TODO Put this logic somewhere else? Freeze camera when pause menu up. Need testing when pause menu added
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * mouse_sensitivity
		pitch -= event.relative.y * mouse_sensitivity
		
#		Prevent people from looking too far around vertically
		pitch = clamp(
			pitch,
			deg_to_rad(min_pitch),
			deg_to_rad(max_pitch)
		)

		yaw_pivot.rotation.y = yaw
		pitch_pivot.rotation.x = pitch
