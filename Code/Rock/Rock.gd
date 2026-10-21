extends ScreenWrapper
class_name Rock

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed: float = 150 #pixels per second
var rotation_speed: float = 180 #degrees per second
var direction: Vector2 = Vector2(0, -1)

func _ready():
	speed = randf_range(150, 300)
	direction.x = randf_range(-1, 1)
	direction.y = randf_range(-1, 1)
	rotation_speed = randf_range(-180, 180)
	animated_sprite_2d.sprite_frames.get_frame_count("default")
	animated_sprite_2d.frame = randi_range(0, 4)

func _process(delta):
	position += direction * speed * delta
	rotation_degrees += rotation_speed * delta
	super._process(delta)
