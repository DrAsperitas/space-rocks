extends PanelContainer
class_name Player

const LIFE = preload("res://Player/assets/Life.tscn")
const SHIP = preload("res://Ship/Ship.tscn")

@onready var score_ui = $VBox/ScoreUI
@onready var lives_ui = $VBox/LivesUI

var score: int = 0
var lives: int = 0
var ship: Ship = null

func _ready():
	UpdateScore(0)
	UpdateLives(3)

func _process(_delta):
	if Input.is_action_just_pressed("launch_ship"):
		if not ship:
			SpawnShip()
			UpdateLives(-1)

func SpawnShip():
	var new_ship = SHIP.instantiate()
	new_ship.player = self
	new_ship.position = get_viewport().size / 2
	get_parent().add_child(new_ship)
	ship = new_ship

func UpdateScore(delta_score: int):
	score += delta_score
	score_ui.text = str(score)

func UpdateLives(_delta_lives: int):
	for n in lives_ui.get_children():
		lives_ui.remove_child(n)
		n.queue_free()
	for l in lives:
		var life = LIFE.instantiate()
		lives_ui.add_child(life)
