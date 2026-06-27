extends Panel

@onready var restart_button: Button = $HBoxContainer/RestartButton
@onready var quit_button: Button = $HBoxContainer/QuitButton

func _ready() -> void:
	restart_button.pressed.connect(_on_restart_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	
func _on_restart_button_pressed() -> void:
	var main_scene = preload("uid://is4fp42oe8ul")
	get_tree().change_scene_to_packed(main_scene)
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
