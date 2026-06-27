class_name SlowApproach
extends Event

var target_destination : Vector3 = Vector3.ZERO
var direction_vector : Vector3
@export var speed : float = 100
@onready var movement_interval_timer: Timer = $MovementIntervalTimer

func _ready() -> void:
	setup()
	var direction : Vector3 = target_destination - position
	direction_vector = direction.normalized()
	movement_interval_timer.timeout.connect(_on_movement_interval_timer_timeout)

		
func _on_movement_interval_timer_timeout() -> void:
		if !visible_on_screen_notifier_3d.is_on_screen():
			print("off screen, ima coming")
			print(position)
			position += direction_vector * speed
