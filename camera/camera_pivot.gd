class_name CameraPivot
extends Node3D


func _process(_delta: float) -> void:
	var camera_move_direction = get_viewport().get_mouse_position() / get_viewport().get_visible_rect().size
	camera_move_direction = (camera_move_direction - Vector2(0.5, 0.5)) * 2
	
	rotation.x = deg_to_rad(-camera_move_direction.y * 10)
	rotation.y = deg_to_rad(-camera_move_direction.x * 15)
	
	
	
