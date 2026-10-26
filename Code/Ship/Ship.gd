extends ScreenWrapper
class_name Ship

const BULLET = preload("res://Bullet/Bullet.tscn")

var rotation_rate: float = 360.0 #degrees per second
var velocity: Vector2 = Vector2.ZERO
var thrust_power: float = 10.0

func _process(delta):
	super._process(delta)
	if Input.is_action_pressed("rotate_ccw"):
		rotation_degrees -= rotation_rate * delta
	if Input.is_action_pressed("rotate_cw"):
		rotation_degrees += rotation_rate * delta
	if Input.is_action_pressed("thrust"):
		var direction = Vector2(sin(rotation), -cos(rotation))
		velocity += direction * thrust_power
	position += velocity * delta
	if Input.is_action_just_pressed("fire"):
		var new_bullet = BULLET.instantiate()
		new_bullet.ship = self
		new_bullet.position = position
		new_bullet.rotation = rotation
		get_parent().add_child(new_bullet)
