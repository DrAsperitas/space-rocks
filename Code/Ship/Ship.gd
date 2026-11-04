extends ScreenWrapper
class_name Ship

const BULLET = preload("uid://db3otv5j2cbxb")


var player: PlayerUI
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
	#if Input.is_action_just_pressed("fire"):
		#fire()
	position += velocity * delta

func destroy_ship():
	player.current_ship = null
	queue_free()


#FIX fire function doesnt work, gives an error
func fire():
	var new_bullet = BULLET.instantiate()
	new_bullet.player = player
	new_bullet.position = position
	new_bullet.rotation = rotation
	get_parent().add_child(new_bullet)
