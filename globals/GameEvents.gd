extends Node

func die() -> void:
	var death_scene = preload("uid://bsag2sgo1njr5")
	get_tree().change_scene_to_packed(death_scene)
	
# This could live under a global config at some point
func is_mobile() -> bool:
	return OS.has_feature("mobile")
