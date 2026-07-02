class_name DoorEvent
extends Event
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var spooky_interval_timer: Timer = $SpookyIntervalTimer
@onready var lifetime_timer: Timer = $LifetimeTimer





const DOOR_CREAK_OPEN = preload("uid://cj8o3guibxn0")
const DOOR_OPEN = preload("uid://dn40h23y03qqr")
const DOOR_SHUT = preload("uid://r88osgax2r44")
const URGENT_DOOR_KNOCK = preload("uid://d2aeyoln6mros")

enum DoorState {
	CREAK,
	OPEN,
	SHUT
}


var state: DoorState

var is_bad_door : bool = false

func _ready() -> void:
	setup()
	state = DoorState.SHUT
	_knock()
	spooky_interval_timer.timeout.connect(_on_spooky_interval_timer_timeout)
	lifetime_timer.timeout.connect(_on_lifetime_timer_timeout)


func _on_screen_entered() -> void:
	if is_bad_door:
		##TODO Add door death cutscene, oh lord
		print("Door killed you")
		get_tree().change_scene_to_file("res://ui/death_screen.tscn")
		


func _on_spooky_interval_timer_timeout() -> void:
	match state:
		DoorState.SHUT:
			if !_is_on_screen(): _door_creak_open()
		DoorState.CREAK:
			if !_is_on_screen(): _door_open()
		DoorState.OPEN:
			if _is_on_screen(): 
				_door_shut()
			else: 
				print("Door is bad now")
				is_bad_door = true
	
func _on_lifetime_timer_timeout() -> void:
	if _is_on_screen() and state != DoorState.OPEN and !is_bad_door:
		queue_free()


func _knock() -> void:
	animation_player.play("Knock")
	audio_stream_player_3d.stream = URGENT_DOOR_KNOCK
	audio_stream_player_3d.play()

	
func _door_creak_open() -> void:
	animation_player.play("Creak_Open")
	audio_stream_player_3d.stream = DOOR_CREAK_OPEN
	audio_stream_player_3d.play()
	state = DoorState.CREAK
	
func _door_open() -> void:
	animation_player.play("Open")
	audio_stream_player_3d.stream = DOOR_OPEN
	audio_stream_player_3d.play()
	state = DoorState.OPEN
	
func _door_shut() -> void:
	animation_player.play("Shut")
	audio_stream_player_3d.stream = DOOR_SHUT
	audio_stream_player_3d.play()
	state = DoorState.SHUT
