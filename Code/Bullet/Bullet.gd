extends ScreenWrapper
class_name Bullet

@onready var timer: Timer = $Timer

var ship: Ship
var speed: float = 300 #pixels per second

func _ready():
	timer.timeout.connect(OnTimedOut)

func _process(delta):
	super._process(delta)
	var direction = Vector2(sin(rotation), -cos(rotation))
	position += direction * speed * delta

func OnTimedOut():
	queue_free() 
