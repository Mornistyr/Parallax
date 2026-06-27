extends Panel
@onready var start_button: Button = $VBoxContainer/StartButton
@onready var quit_button: Button = $VBoxContainer/QuitButton
@export var main_scene : PackedScene




func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	
func _on_start_button_pressed() -> void:
	if main_scene:
		get_tree().change_scene_to_packed(main_scene)
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
