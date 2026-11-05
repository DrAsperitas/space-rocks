extends ScreenWrapper
class_name Rock

const ROCK = preload("uid://duiesnqf505sd")

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var main: Main

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

func split():
	if scale.x > 0.25:
		for i in 2:
			var rock: Rock = ROCK.instantiate()
			rock.position = position
			rock.scale = scale * 0.5
			get_parent().add_child.call_deferred(rock)
	
	queue_free()


func on_area_entered(other_area: Area2D):
	if other_area is Bullet:
		if other_area.player != null:
			main.just_scored(1, other_area.player)
		other_area.queue_free()
		queue_free()
	if other_area is Ship:
		other_area.destroy_ship()
		split()
