extends PanelContainer
class_name PauseMenu

@onready var play_button: Button = $VBox/PlayButton
@onready var quit_button: Button = $VBox/QuitButton
@onready var continue_button: Button = $VBox/ContinueButton

var main: Main

func _ready() -> void:
	play_button.pressed.connect(on_play_pressed)
	quit_button.pressed.connect(on_quit_pressed)
	continue_button.pressed.connect(on_continue_pressed)
	
	main = get_parent()
	show()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		if get_tree().paused:
			show()
		else:
			hide()

func on_play_pressed():
	main.spawn_rocks()
	main.spawn_player()
	hide()

func on_continue_pressed():
	get_tree().paused = false
	hide()

func on_quit_pressed():
	get_tree().quit()
