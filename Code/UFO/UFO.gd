extends Area2D
class_name UFO

const BULLET = preload("res://Bullet/Bullet.tscn")
@onready var fire_timer: Timer = $FireTimer
@onready var turn_timer: Timer = $TurnTimer

var speed: float = 50.0
var velocity_y: float = 0.0


func _ready() -> void:
	turn_timer.timeout.connect(on_timeout)
	fire_timer.timeout.connect(fired)
	var viewportsize = get_viewport().size
	if position.x > viewportsize.x - viewportsize.x / 2:
		speed *= -1


func _process(delta: float) -> void:
	position += Vector2(speed, 0) * delta
	position.y += velocity_y * delta
	var height = get_viewport().size.y
	if position.y < 0:
		position.y = height
	if position.y > height:
		position.y = 0

func fired():
	var new_bullet = BULLET.instantiate()
	new_bullet.position = position
	new_bullet.rotation_degrees = randf_range(0.0, 360.0)
	get_parent().add_child(new_bullet)

func on_timeout():
	if velocity_y != 0:
		velocity_y = 0
	else:
		var rando = randi_range(0, 1)
		if rando:
			velocity_y = -speed
		else:
			velocity_y = speed
