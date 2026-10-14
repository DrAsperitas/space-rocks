extends ScreenWrapper
class_name Ship

var rotation_rate: float = 180.0 #degrees per second
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
