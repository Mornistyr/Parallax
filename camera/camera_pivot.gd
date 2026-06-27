class_name CameraPivot
extends Node3D

var pitch: float = 0.0	
var yaw: float = 0.0
var roll: float = 0.0

func _physics_process(delta: float) -> void:
	var gyro: Vector3 = Input.get_gyroscope()
	pitch += gyro.x * delta
	yaw += gyro.y * delta
	roll += gyro.z * delta
	
	rotation = Vector3(pitch, yaw, roll)



#func _process(delta: float) -> void:
	#var camera_move_direction = get_viewport().get_mouse_position() / get_viewport().get_visible_rect().size
	#camera_move_direction = (camera_move_direction - Vector2(0.5, 0.5)) * 2
	#
	#rotation.x = deg_to_rad(-camera_move_direction.y * 10)
	#rotation.y = deg_to_rad(-camera_move_direction.x * 15)
	
	
	
