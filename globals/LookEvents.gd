extends Node

var looked_at_events : int = 0

func _ready() -> void:
	pass

func looking_at_event() -> void:
	looked_at_events += 1
	
func looking_away_from_event() -> void:
	if looked_at_events > 0:
		looked_at_events -= 1
