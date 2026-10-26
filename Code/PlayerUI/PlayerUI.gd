extends PanelContainer
class_name PlayerUI

const LIFE = preload("res://PlayerUI/assets/Life.tscn")

@onready var score_ui: Label = $VBox/ScoreUI
@onready var lives_ui: HBoxContainer = $VBox/LivesUI

var score = 0
var lives = 3

func _ready() -> void:
	UpdateScore(1)
	UpdateLives(3)
	

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
