extends Node3D

var current_rotation: Vector3 = Vector3.ZERO

# This logic is currently unused in this file, pulled the logic to camera_rig for now
func _physics_process(delta: float) -> void:
	# Get the angular velocity in rad/s
	var gyro_velocity: Vector3 = Input.get_gyroscope()
	
	# Integrate velocity over time to get rotation
	current_rotation += gyro_velocity * delta
	
	# Apply to your object
	rotation = current_rotation
