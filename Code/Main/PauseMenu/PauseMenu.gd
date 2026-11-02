extends PanelContainer

@onready var play_button: Button = $VBox/PlayButton
@onready var quit_button: Button = $VBox/QuitButton


func _ready() -> void:
	play_button.pressed.connect(on_play_pressed)
	quit_button.pressed.connect(on_quit_pressed)
	show()

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		get_tree().quit()

func on_play_pressed():
	print("PLAY")

func on_quit_pressed():
	print("QUIT")
