class_name CameraRig
extends Node3D

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


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	yaw = yaw_pivot.rotation.y
	pitch = pitch_pivot.rotation.x

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * mouse_sensitivity
		pitch -= event.relative.y * mouse_sensitivity

		pitch = clamp(
			pitch,
			deg_to_rad(min_pitch),
			deg_to_rad(max_pitch)
		)

		yaw_pivot.rotation.y = yaw
		pitch_pivot.rotation.x = pitch
