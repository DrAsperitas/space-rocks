extends PanelContainer
class_name PlayerUI

const LIFE = preload("res://PlayerUI/assets/Life.tscn")
const SHIP = preload("res://Ship/Ship.tscn")
const MAIN = preload("res://Main/Main.tscn")

@onready var score_ui: Label = $VBox/ScoreUI
@onready var lives_ui: HBoxContainer = $VBox/LivesUI

var main: Main

var current_ship: Ship = null

var score = 0
var lives = 0

func _ready() -> void:
	UpdateScore(1)
	UpdateLives(3)

func _process(_delta: float) -> void:
	spawn_ship()
	check_game_over()


func UpdateScore(delta_score):
	score += delta_score
	score_ui.text = str(score)

func UpdateLives(delta_lives):
	lives += delta_lives
	clear_lives()
	build_lives()

func clear_lives():
	for child in lives_ui.get_children():
		child.queue_free()

func build_lives():
	for l in lives:
		var life = LIFE.instantiate()
		lives_ui.add_child(life)

func check_game_over():
	if lives <= 0 and current_ship == null:
		main.pause_menu.show()
		print("YOU LOSE")

func spawn_ship():
	if Input.is_action_just_pressed("launch_ship"):
		if current_ship == null:
			UpdateLives(-1)
			var ship = SHIP.instantiate()
			ship.player = self
			ship.position = get_viewport().size / 2 
			get_parent().add_child(ship)
			current_ship = ship
