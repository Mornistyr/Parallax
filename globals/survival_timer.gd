extends Timer

var survival_time_seconds : int

func _ready() -> void:
	timeout.connect(_on_timeout)
	
func _on_timeout() -> void:
	survival_time_seconds += 1
	
func _get_survival_seconds() -> int:
	return survival_time_seconds
