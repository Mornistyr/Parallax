class_name SlowApproach
extends Event

var target_destination : Vector3 = Vector3.ZERO
var direction_vector : Vector3
@export var speed : float = 100
@onready var movement_interval_timer: Timer = $MovementIntervalTimer
@onready var lifetime_timer: Timer = $LifetimeTimer

func _ready() -> void:
	setup()
	movement_interval_timer.timeout.connect(_on_movement_interval_timer_timeout)
	lifetime_timer.timeout.connect(_on_lifetime_timer_timeout)

		
func _on_movement_interval_timer_timeout() -> void:
		if !visible_on_screen_notifier_3d.is_on_screen():
			var direction : Vector3 = target_destination - position
			direction_vector = direction.normalized()
			print("off screen, ima coming")
			print(position)
			position += direction_vector * (speed * 2)
		else:
			var direction : Vector3 = position - target_destination
			direction_vector = direction.normalized()
			print("on screen, ima leaving")
			print(position)
			position += direction_vector * speed
			
func _on_lifetime_timer_timeout() -> void:
	if visible_on_screen_notifier_3d.is_on_screen():
		queue_free()
