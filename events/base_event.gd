class_name Event
extends Node3D

@onready var visible_on_screen_notifier_3d: VisibleOnScreenNotifier3D = $VisibleOnScreenNotifier3D

func _ready() -> void:
	setup()
	
func _on_screen_entered() -> void:
	LookEvents.looking_at_event()
	
func _on_screen_exited() -> void:
	LookEvents.looking_away_from_event()
	
func setup()-> void:
	visible_on_screen_notifier_3d.screen_entered.connect(_on_screen_entered)
	visible_on_screen_notifier_3d.screen_exited.connect(_on_screen_exited)
	look_at(Vector3.ZERO)
