class_name EventManager
extends Node3D


@export var events : Array[PackedScene]

@onready var spawn_interval_timer: Timer = $SpawnIntervalTimer
@onready var spawner_pivot: Marker3D = $SpawnerPivot
@onready var spawn_marker: Marker3D = $"SpawnerPivot/Spawn Marker"



func _ready() -> void:
	spawn_interval_timer.timeout.connect(_on_spawn_interval_timer_timeout)
	
	
func _on_spawn_interval_timer_timeout() -> void:
	var random_event = events.pick_random()
	var event = random_event.instantiate()
	_set_spawner_pivot()
	get_parent().add_child(event)
	event.global_position = spawn_marker.global_position
	event.look_at(Vector3.ZERO)
	
	

func _set_spawner_pivot() -> void:
	spawner_pivot.rotate_y(randf_range(-179.9, 179.9))
	
