extends Node

func die() -> void:
	var death_scene = preload("uid://bsag2sgo1njr5")
	get_tree().change_scene_to_packed(death_scene)
