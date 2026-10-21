extends Node
class_name Main

const Ufo = preload("res://UFO/UFO.tscn")
@onready var ufo_timer: Timer = $UFOTimer

func _ready() -> void:
	ufo_timer.timeout.connect(on_ufo_spawn)

func on_ufo_spawn():
	var ufo : UFO = Ufo.instantiate()
	if randi() % 2:
		ufo.position.x = 0
	else:
		ufo.position.x = get_viewport().size.x
	ufo.position.y  = randf_range(0.0, get_viewport().size.y )
	add_child(ufo)

func _process(delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
